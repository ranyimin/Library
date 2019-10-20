<%@page import="java.sql.ResultSet"%>
<%@page import="admin.ConnDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String readerid = (String) session.getAttribute("readerid");
		String bookid = (String) session.getAttribute("bookid");
		String adminid = (String) session.getAttribute("adminid");
		String id = "";
		String name = "";
		//前面已经定义此处可以不用定义      
		//String bookid="";      
		String bookname = "";
		String author = "";
		String press = "";
		float price = 0;
		String isbn = "";
		String state = "";
		//将两个 session 值移除   

		session.removeAttribute("readerid");
		session.removeAttribute("bookid");
		out.print("<br> readerid:" + readerid + "<br>bookid:" + bookid);
		String sqlreaderid = "select * from reader where id='" + readerid + "'";
		String sqlbookid = "select * from book where bookid='" + bookid + "'";
		out.print("<br>book=" + sqlbookid);
		out.print("<br>reader=" + sqlreaderid);
		ConnDB conn = new ConnDB();
		ResultSet rsr = conn.myExcuteQuary(sqlreaderid);
		ResultSet rsb = conn.myExcuteQuary(sqlbookid);
		while (rsr.next()) {
			id = rsr.getString("id");
			name = rsr.getString("name");
		}
		while (rsb.next()) {
			bookname = rsb.getString("bookname");
			author = rsb.getString("author");
			press = rsb.getString("press");
			price = rsb.getFloat("price");
			isbn = rsb.getString("isbn");
			state = rsb.getString("state");
		}
		String sqlbook = "update book set state='已借' where  bookid='" + bookid + "'";
		String sqlinsert = "insert into lendreturn(id,bookid,state,adminid,lendtime) values('" + id + "','" + bookid
				+ "','已借','" + adminid + "'," + "GETDATE())";
		conn.myExcuteUpdate(sqlbook);
		conn.myExcuteUpdate(sqlinsert);
		rsr.close();
		rsb.close();
		conn.close();
		out.print("success");
	%>
</body>
</html>
