<%@page import="java.net.ConnectException"%>
<%@ page import="java.sql.ResultSet"%>


<%@ page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="conn" class="admin.ConnDB" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改自己的密码</title>
</head>
<body>
	<br>
	<br>
	<br>
	<br> 修改用户名和密码
	<%
		String adminid =(String) session.getAttribute("adminid");
		String name= request.getParameter("name");
		String oldpw= request.getParameter("oldpw");
		String newpw1= request.getParameter("newpw1");
		String newpw2= request.getParameter("newpw2");
		
		boolean flag=true;
		if("".equals(oldpw)){
		
	 %>
	<script type="text/javascript">
	 	window.alert('原密码不能为空');
	 	window.history.back();
	 </script>
	<% 
	 	flag=false;
	 	}
	 	if("".equals(newpw2)||"".equals(newpw2)){
	 %>
	<script type="text/javascript">
	 	window.alert('新密码不能为空');
	 	window.history.back();
	 </script>
	<% 
	 	flag=false;
	 }
	 if(!newpw1.equals(newpw2)){
	 %>
	<script type="text/javascript">
	 	window.alert('两次密码不一致');
	 	window.history.back();
	 </script>
	<%
	 	flag=false;
	 }
	 String sql ="select * from admin where adminid='"+adminid+"'";
	 out.print("<br>sql"+sql);
	 ResultSet rs=conn.myExcuteQuary(sql);
	 String dbpw="";
	 while(rs.next()){
	 	dbpw = rs.getString("password");
	 }
	 if(oldpw.equals(dbpw)){
	 	//密码相同 准备修改密码
	 	sql="update admin set name='"+name+"',password='"+newpw1+"'where adminid='"+adminid+"'";
	 
	 	int count=0;
	 	count = conn.myExcuteUpdate(sql);
	 	if(count==1){
	%>
	<script type="text/javascript">
		window.alert('密码修改成功！');
		window.history.back();
	</script>
	<%
		}
		} else {
			return;
		}
		rs.close();
		conn.close();
		response.sendRedirect("admin.html");
	%>
	<div align="center"></div>

</body>
</html>