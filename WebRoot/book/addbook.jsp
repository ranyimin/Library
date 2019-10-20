<%@page import="java.sql.ResultSet" %>
<%@page import="db.Conndb" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<!--用来说明使用的是html版本  -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>添加图书</title>
</head>

<body>
   <div align="center">
            添加图书
        <form name="form2" method="post" action="selectsbn.jsp">
        <font color="pink">  <br></font>
          请输入准备添加的图书的ISBN
        <input type="text" name="ISBN2" id="isb2">
        <input type="submit" name="button" id="button" value="查询ISBN">
        </form>
   </div>
  
</body>
</html>