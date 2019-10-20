<%@page import="db.ConnDB"%>
<%@page import="java.sql.ResultSet"%>

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
		int id1 = 0;

		String readerid = (String) session.getAttribute("readerid");
		//System.out.println(":" + readerid + ";;;;;;;;;;;;;;;;");
	
		String bookid = (String) session.getAttribute("bookid");
		String adminid = (String) session.getAttribute("id");
	//	System.out.println("sqlreaderid:" + readerid + ";;;;;;;;;;;;;;;;");
		String id = "";
		String name = "";
		//前面已经定义此处可以不用定义      

		String bookname = "";
		String press = "";
		float price = 0;
		String isbn = "";
		String state = "";//状态
		//将两个 session 值移除   

		//	out.print("<br> readerid:" + readerid + "<br>bookid:" + bookid);
		String sqlreaderid = "select * from reader where id=" + readerid + "";
		String sqlbookid = "select * from book where bookid='" + bookid + "'";
		//out.print("<br>book=" + sqlbookid);
		//out.print("<br>reader=" + sqlreaderid);
		ConnDB conn=new ConnDB();
		//System.out.println("sqlbookid:" + sqlbookid);
		//	System.out.println("sqlreaderid:" + sqlreaderid);
		ResultSet rsr = conn.myExcuteQuary(sqlreaderid);
		ResultSet rsb = conn.myExcuteQuary(sqlbookid);
		//System.out.println("-----------------");

		while (rsr.next()) {
			id1 = rsr.getInt("id");
			name = rsr.getString("name");
			//	System.out.print(name + "*************" + "\n");
			//	System.out.println("-----------------///////");
		}
		while (rsb.next()) {
			//	System.out.println("\\\\\\-----------------");
			bookname = rsb.getString("bookname");
			bookid = rsb.getString("bookid");
			price = rsb.getFloat("price");
			isbn = rsb.getString("ISBN");
			state = rsb.getString("state");
			//	System.out.print(press + "*************" + "\n");
			//	System.out.print(price + "*************" + "\n");
			///	System.out.print(isbn + "*************" + "\n");
			//	System.out.print(state + "*************" + "\n");
			//System.out.println("----------*************-------");
		}
		String sqlbook = "update book set state='已借' where  bookid='" + bookid + "'";
		String sqlinsert = "insert into lendreturn(adminid,readerid,bookid,bookname,ISBN,state,lendtime) values('"
				+ adminid + "'," + id1 + ",'" + bookid + "','" + bookname + "','" + isbn + "','已借',"
				+ "GETDATE())";
		///	System.out.print(sqlbook + "**************************************");
		//System.out.print(sqlinsert + "**************************************");
		conn.myExcuteUpdate(sqlbook);
		conn.myExcuteUpdate(sqlinsert);
		rsr.close();
		rsb.close();
		conn.close();
		//out.print("success");
	%>
	<script type="text/javascript">
	alert("结束成功");
	location.href="brrowbook.jsp";
	
	</script>
</body>
</html>
