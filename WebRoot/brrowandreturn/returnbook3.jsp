<%@page import="db.ConnDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String readerid = (String) session.getAttribute("id1");//获取前一夜传过来的读者id
	
		String adminid = (String) session.getAttribute("readerid1");//获取前一夜传过来的读者id
		String bookid = (String) session.getAttribute("bookid");//获取前一夜传过来的bookid
			System.out.println(readerid+" -------------");
		System.out.println(bookid+" -------------");
		ConnDB connDB = new ConnDB();
		String sqllend = "update  lendreturn set state='已还',returntime=getdate() where readerid='" + readerid + "'";
		String sqlbook = "update  book set state='已还' where bookid='" + bookid + "'";
		connDB.myExcuteUpdate(sqllend);
		connDB.myExcuteUpdate(sqlbook);
	%>
	<script type="text/javascript">
	
	alert("还书成功");
	location.href="returnbook.jsp";
	
	</script>
</body>
</html>