<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<jsp:useBean id="db" class="reader.ReaderDB"></jsp:useBean>
<title>添加管理员</title>
</head>

<body>
	<jsp:useBean id="car" scope="request" class="reader.Reader" />
	<jsp:setProperty name="car" property="*" />
	<%
    String id="";
    	System.out.print("<br>  car===="+car);
		//String name = request.getParameter("name");
		//String sex = request.getParameter("sex");
		//String pw = request.getParameter("pw");
		car.insertReader(car);
	//	String sql = "insert into admin (name,sex,pw) values('" + car.+ "','" + sex + "','" + pw + "')";

		//out.print(sex+"********");

		//db.addadmin(sql);
		String sql="select id from reader where name='"+car.getName()+"'";
      ResultSet	rs=	db.find(sql);
		while(rs.next()){
		  id=rs.getString("id");
		}
	%>
	<script type="text/javascript">
        window.alert("添加成功，这是你的id号码:<%=id%>,请注意保存，点击确定返回上一页")
        window.history.back("add.html");//后退+刷新

    </script>
	<%
		
	%>

</body>

</html>
