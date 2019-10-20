<%@page import="admin.ConnDB"%>
<%@page import="reader.ReaderDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<jsp:useBean id="alter" class="reader.Reader" scope="page" />
<jsp:setProperty name="alter" property="*"/>
<body>

<%
ConnDB connDB=new ConnDB();
String sql="update reader set name='"+alter.getName()+"' ,sex='"+alter.getSex()+"',tel='"+alter.getTel()+"',pw='"+alter.getPw()+"' where id='"+alter.getId()+"'";
connDB.alter(sql);


 %>
</body>
</html>