<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background: #FFB6C
}
</style>
</head>
<body>
	<%
		response.setCharacterEncoding("utf-8");
		Object pw=session.getAttribute("pw");
		Object id=session.getAttribute("id");
	//	out.print(pw);
	%>
	<form action="alterpw1.jsp" method="post">
	请输入原密码：<input type="password" name="pw1"><br>
	请输入新密码：<input type="password" name="pw2"><br>
	请确认密码：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="pw3"><br>
	<input type="submit" value="确认修改">
</form>
	<%
   response.setCharacterEncoding("utf-8");
		session.setAttribute("pw", pw);
		session.setAttribute("id", id);
	%>
</body>
</html>