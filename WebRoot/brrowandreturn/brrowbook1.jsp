<%@page import="reader.ReaderDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.ConnDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<form action="brrowbook2.jsp" method="post">
			<%
				ReaderDB readerDB = new ReaderDB();
				String readerid = request.getParameter("readerid");
				if (!readerDB.isUser(readerid)) {
			%>
			<script type="text/javascript">
			       window.alert("该账号信息不存在，请重新输入！！");
                            window.history.back();
			</script>

			<%
				}
				String bookid = request.getParameter("bookid");
				session.setAttribute("readerid", readerid);
				session.setAttribute("bookid", bookid);
				if ("".equals(bookid) || "".equals(readerid)) {
					//输入的图书编号或者读者编号为空则弹出对话框，然后返回   
					out.print(
							"<script type='text/javascript'> window.alert('读者信息或者图书信息不能为空');window.history.back();</script>");
				}
				String id = "";
				String name = "";
				//前面已经定义此处可以不用定义      
				//String bookid="";      
				String bookname = "";
				float price = 0;
				String isbn = "";
				String state = "";
				//out.print(sb);      

				String sqlreaderid = "select * from reader where id='" + readerid + "'";
				String sqlbookid = "select * from book where bookid='" + bookid + "'";
				ConnDB conn = new ConnDB();
				ResultSet rsr = conn.myExcuteQuary(sqlreaderid);
				ResultSet rsb = conn.myExcuteQuary(sqlbookid);
				//读出读者和书籍的相关信息       

				while (rsr.next()) {
					id = rsr.getString("id");
					name = rsr.getString("name");
				}
				//如果成立则说明没有找到读者信息       
				if (name.equals("")) {
				}
				//读取书籍信息只有一条或者没有 一般按照图书是肯定有的但是不能排除 随意输入的信息             
				while (rsb.next()) {
					bookname = rsb.getString("bookname");

					price = rsb.getFloat("price");
					isbn = rsb.getString("isbn");
					state = rsb.getString("state");
				}
				//如果成立则说明没有找到数据       
				if (bookname.equals("")) {
					out.print("<script type='text/javascript'> window.alert('图书信息未找到');</script>");
				}
				rsr.close();
				rsb.close();
				conn.close();
			%>
			<%
				//如果读者信息不为空则显示读者信息      
				if (!name.equals("")) {
			%>
			<table border='1' align='center'>
				<caption>读者信息</caption>
				<tr>
					<td>读者编号</td>
					<td>读者姓名</td>
				</tr>
				<tr>
					<td><%=id%></td>
					<td><%=name%></td>
				</tr>
			</table>

			<%
				}
			%>

			<%
				//如果图书信息不为空则输出图书信息      
				if (!bookname.equals("")) {
			%>

			<br> <br>
			<h3>书籍相关信息</h3>
			<table border="1">

				<tr>
					<td>图书 id</td>
					<td>图书名</td>


					<td>图书价格</td>
					<td>ISBN</td>
					<td>状态</td>
				</tr>
				<tr>
					<td><%=bookid%></td>
					<td><%=bookname%></td>


					<td><%=price%></td>
					<td><%=isbn%></td>
					<td><%=state%></td>
				</tr>
				<%
					if (state.equals("已还") && !bookname.equals("")) {
							out.print(
									"<tr><td colspan='7' align='right'><br><input type='submit' name='sb3' value='借书'></td> </tr>");
						}
				%>
			</table>
		</form>
	</div>
	<%
		}
	%>


</body>
</html>
