<%@page import="db.Conndb"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<% request.setCharacterEncoding("utf-8"); %>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
</head>
<body>
  <%
     String[] bookid=request.getParameterValues("bookid");
     String[] bookname=request.getParameterValues("bookname");
     String[] price=request.getParameterValues("price");
     String[] ISBN=request.getParameterValues("ISBN");
     //获取记录的条数
     int count=bookid.length;
     String[] state=new String[count];
     Conndb conn=new Conndb();
     for(int i=0;i<bookid.length;i++){
       state[i]=request.getParameter("state"+bookid[i]);
       String sql="update Book set"+"bookname='"+bookname[i]+"',price='"+price[i]+"',ISBN='"+ISBN[i]+"',state='"+state[i]+"'where bookid='"+bookid[i]+"'";
       conn.myExcuteUpdate(sql);
       
     }
     conn.close();
     response.sendRedirect("alterbook.jsp");
   %>
</body>
</html>