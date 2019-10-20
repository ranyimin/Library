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
		request.setCharacterEncoding("utf-8");
		String[] adminid = request.getParameterValues("adminid");
		String sql = "";
		//上一页有数据传递过来
		ConnDB connDB=new ConnDB();
		if (adminid != null) {
			for (int i = 0; i < adminid.length; i++) {
				sql = "delete from admin where adminid='" + adminid[i] + "'";
				out.print("<br>sql=" + sql);
				
			}
			connDB.close();
			response.sendRedirect("deleteadmin.html");
		} else {
			out.print("<br> 您没有选中任何的删除数据");
		}
	%>
</body>
</html>