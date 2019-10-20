<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<jsp:useBean id="db" class="admin.ConnDB"></jsp:useBean>
<title>添加用户</title>
</head>

<body>
	<jsp:useBean id="car" scope="request" class="reader.Reader" />
	<jsp:setProperty name="car" property="*" />
	<%
    
    //	System.out.print("<br>  car===="+car);
		//String name = request.getParameter("name");
		//String sex = request.getParameter("sex");
		//String pw = request.getParameter("pw");
		car.insertReader(car);
	//	String sql = "insert into admin (name,sex,pw) values('" + car.+ "','" + sex + "','" + pw + "')";

		//out.print(sex+"********");

		//db.addadmin(sql);
		
	%>
	<script type="text/javascript">
        window.alert("添加成功，点击确定返回上一页")
        window.history.back("addreader.html");//后退+刷新

    </script>

</body>

</html>
