<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:useBean id="db" class="reader.ReaderDB" scope="page"></jsp:useBean>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%
	
		String id1 = request.getParameter("readerid");
		session.setAttribute("id1", id1);
        System.out.print(id1+"///////////////");
		if(id1.equals("")||id1==null){
		%>
	<script type="text/javascript">
                        window.alert("输入不能为空，请重新输入");
                        window.history.back();

                    </script>
	<%}
	else{
		if(!db.isUser(id1)){
			%>
	<script type="text/javascript">
                            window.alert("该账号不存在，请重新输入！！");
                            window.history.back();

                        </script>

	<%
		} else {

				String sql = "select * from lendreturn where  readerid='" + id1 + "'and state='已借'";
				ResultSet rs = db.find(sql);
				if (rs.next()) {
					int id = rs.getInt("id");
					//	String adminid=rs.getString("id");
					String readerid = rs.getString("readerid");
					String bookid = rs.getString("bookid");
					session.setAttribute("bookid", bookid);
					String bookname = rs.getString("bookname");
					String isbn = rs.getString("ISBN");
					String state = rs.getString("state");
					Date lendtime = rs.getDate("lendtime");
	%>
	if(state=="已借"){
	<table border="1">
		<h3>还书</h3>
		<tr>
			<td>读者编号</td>
			<td>书籍编号</td>
			<td>书名</td>
			<td>ISBN</td>
			<td>状态</td>
			<td>借书时间</td>
		</tr>

		<form action="returnbook3.jsp" method="post">
			<tr>
				<td><%=readerid%></td>
				<td><%=bookid%></td>
				<td><%=bookname%></td>

				<td><%=isbn%></td>
				<td><%=state%></td>
				<td><%=lendtime%></td>
				<td><input type="submit" value="还书"></td>
			</tr>
	</table>
	</form>
	<%
	
		
		}
		else{
		%>

	<script type="text/javascript">
                        window.alert("未查询到该账号未还书记录");
                        window.history.back();

                    </script>
	<%
		}

			}
		}
	
	%>
</body>

</html>
