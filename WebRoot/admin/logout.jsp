<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    String path =request.getContextPath();
    String basePath=
    request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="_parent">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户注销自动跳转</title>
</head>
<body>
	<%
		session.invalidate();
		out.println("<script>");
		out.println("window.top.location.href='"+basePath+"'");
		out.println("</script>");
	 %>
</body>
</html>