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
	background-color: aqua;
}
a{
    padding-left: 90%;
    color: crimson;
    }
    #top{
        height: 30%;
       
    }
</style>
</head>
<body>
	<%
		response.setCharacterEncoding("utf-8");
		Object id = session.getAttribute("id");
		Object name = session.getAttribute("name");
	%>
	<div id="top">
		<h1>
			欢迎您：<%=name%>小可爱,嘻嘻嘻！！</h1>
	</div>
     <h3>  <a  target="_top" style="text-decoration: none" href="../index.html">注销登陆</a></h3> 
</body>
</html>