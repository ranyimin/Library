<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.ConnDB"%>
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
		<%
			//看是否点击了 sb 提交按钮  
			String sb = request.getParameter("sb");
			String find = request.getParameter("find");
			String radio = request.getParameter("radio");
			//未完成      
			//select book.bookid,book.bookname, book.isbn ,admin.name from  lendreturn  as lr, admin,book,reader  where admin.adminid=lr.adminid and lr.id=reader.id and book.bookid=lr.bookid and lr.id like '%1%' 
			String sql = "select readerid,lt.bookid,lt.ISBN,bookname,lt.state,lendtime,returntime  from lendreturn as lt,book as b where lt.bookid=b.bookid ";
			//	out.print("<br>" + sb + " 检索文字 ：" + find + " 类型：" + radio);
			//检索字符为空则返回      
			if ("".equals(find)) {
				out.print("<script type='text/javascript'>  window.alert('检索字符不能为空');window.history.back();</script>");
			} else {
				if (radio.equals("readerid")) {
					sql = sql + " and  readerid like '%" + find + "%'";
				}
				if (radio.equals("bookid")) {
					sql = sql + " and  lt.bookid like '%" + find + "%'";
				}
				if (radio.equals("ISBN")) {
					sql = sql + " and  ISBN like '%" + find + "%'";
				}
				if (radio.equals("bookname")) {
					sql = sql + " and  bookname like '%" + find + "%'";
				}
			sql="select * from lendreturn ";
			//	out.print("<br>sql=" + sql);
			}
			ConnDB cd = new ConnDB();
			ResultSet rs = cd.myExcuteQuary(sql);
		%>
		<h3>借阅记录</h3>
		<table border="1">
			<tr>
				<td>读者编号</td>
				<td>书籍编号</td>
				<td>书籍 ISBN</td>
				<td>书名</td>
				<td>状态</td>
				<td>借书时间</td>
				<td>还书时间</td>
			</tr>
			<%
				//select id,lt.bookid ,bookname,lt.state,lendtime,returntime    
				while (rs.next()) {

					String readerid = rs.getString("readerid");
					String bookid = rs.getString("bookid");
					String bookname = rs.getString("bookname");
					String isbn = rs.getString("ISBN");
					String state = rs.getString("state");
					Date lendtime = rs.getDate("lendtime");
					Date returntime = rs.getDate("returntime");
					//out.print("<br>" + bookid + "******************");
				//	System.out.print(readerid + "*****");
					//System.out.print(bookid + "*****");
			%>
			<tr>

				<td><%=readerid%></td>
				<td><%=bookid%></td>
				<td><%=isbn%></td>
				<td><%=bookname%></td>
				<td><%=state%></td>
				<td><%=lendtime%></td>
				<td><%=returntime%></td>
			</tr>
			<%
				}
				rs.close();
				cd.close();
			%>
		</table>
	</div>
</body>
</html>
