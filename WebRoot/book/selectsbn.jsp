<%@page import="java.sql.ResultSet"%>
<%@page import="db.Conndb"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<body>
	<jsp:useBean id="Conndb" class="db.Conndb"></jsp:useBean>
	<%
		String bookid = "";
		String bookname = "";
		String ISBN = "";
		float price = 0;
		String ISBN2 = request.getParameter("ISBN2");
		if (ISBN2==null||ISBN2.equals("")) {
	%>
	<script type="text/javascript">
		alert("不能为空");
	</script>
	<%
		// session.setAttribute("dis", "您未录入任何ISBN的信息,请注意输入<br>");
			response.sendRedirect("addbook.jsp");
		} else {
			session.setAttribute("dis", "");
			String sql = "select * from Book where ISBN='" + ISBN2 + "'";
			System.out.print(sql);
			ResultSet rs = Conndb.myExcuteQuary(sql);
			while (rs.next()) {
				bookid = rs.getString("bookid");
				bookname = rs.getString("bookname");
				ISBN = rs.getString("ISBN");
				price = rs.getFloat("price");
				break;
			}
			rs.close();
			Conndb.close();
		}
	%>
	<div align="center">
		<form name="form1" method="post" action="inputbook.jsp">
			<%
				if (bookname.equals("")) {
					out.print("数据库未找到与" + ISBN2 + "的相关信息，需要您自己手动输入相关信息<br>");

				}
			%>
			<p>请输入库书籍的基础信息然后提交</p>
			<br>
			<tr>
				<td>书籍编号</td>
				<td><input type="text" name="bookid" id="bookid"
					value="<%=bookid%>"></td>
			</tr>
			<tr>
				<td>书名</td>
				<td><input type="text" name="bookname" id="bookname"
					value="<%=bookname%>"></td>
			</tr>
			<tr>
				<td>ISBN</td>
				<td><input type="text" name="ISBN" id="ISBN"
					value="<%=ISBN2%>"></td>
			</tr>
			<tr>
				<td>价格</td>
				<td><input type="text" name="price" id="price"
					value="<%=price%>"></td>
			</tr>

			书籍状态&nbsp;&nbsp;&nbsp;已借<input type="radio" name="state" id="state1"
				value="已借">&nbsp;&nbsp;&nbsp;&nbsp; 已还<input type="radio"
				name="state" id="state2" value="已还" checked="checked"><br><br> 
			<input type="reset" name="reset" value="重置">&nbsp;&nbsp;&nbsp;
			<input type="submit"  name="submit" id="reset" value="提交">

		</form>

	</div>
</body>
</html>