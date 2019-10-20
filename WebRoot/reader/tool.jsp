<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


</head>

<body>
	<%
		response.setCharacterEncoding("utf-8");
		Object id = session.getAttribute("id");
		Object name = session.getAttribute("name");

		if (id == null && name == null) {
			response.sendRedirect("top.jsp");
		}
	%>
</body>
</html>
