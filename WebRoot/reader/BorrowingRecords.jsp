<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="book.BookDB"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>借书记录</title>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		//out.print(id+"------");
		String sql = "select * from book where readerid=" + id + "";

		ResultSet rs = db.bookmessage(sql);
	%>
	<table border="1" >
		<tr><td>借书记录</td></tr>
		<tr>
			<td>读者编号</td>
			<td>读者姓名</td>
			<td>书的编号</td>
			<td>书名</td>
			<td>ISBN</td>
			<td>状态</td>
			<td>借书时间</td>
			<td>还书时间</td>
		</tr>
		<%
			while (rs.next()) {
				String readerid = rs.getString("readerid");
				String readername = rs.getString("readername");
				String bookid = rs.getString("bookid");
				String bookname = rs.getString("bookname");
				String ISBN = rs.getString("ISBN");
				String zt = rs.getString("状态");//状态
				String jstime = rs.getString("借书时间");
				String hstime = rs.getString("还书时间");
		%>



		<tr>
			<td><%=readerid%></td>
			<td><%=readername%></td>
			<td><%=bookid%></td>
			<td><%=bookname%></td>
			<td><%=ISBN%></td>
			<td><%=zt%></td>
			<td><%=jstime%></td>
			<td><%=hstime%></td>

		</tr>

		<%
			}
		%>
	</table>
	.x
</body>
</html>