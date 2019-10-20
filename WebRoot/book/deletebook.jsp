<%@page import="db.Conndb"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>删除图书</title>
</head>
<body>
  <%
    String[] bookid=request.getParameterValues("id");
    Conndb conndb=new Conndb();
    for(int i=0;i< bookid.length;i++){
      String sql="delete from Book where bookid='"+bookid[i]+"'";
      out.print("<br>"+sql);
      conndb.myExcuteUpdate(sql);
    }
    conndb.close();
    response.sendRedirect("selecteanddeletebook.jsp");
   %>
</body>
</html>