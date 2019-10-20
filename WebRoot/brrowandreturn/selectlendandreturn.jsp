<%@page import="java.sql.ResultSet"%>
<%@page import="db.ConnDB"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>     
<% request.setCharacterEncoding("utf-8") ;%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title> 
</head> 
<body>  
	<div align="center">      
		<p>借阅情况查询 </p>     
      <hr>      
      <form name="form1" method="post" action="selectlendandreturn2.jsp">         
      	<p>查询：<input type="text" name="find" id="find">           
      读者账号 <input type="radio" name="radio"  value="readerid"  checked="checked"> &nbsp;&nbsp;&nbsp;&nbsp;                  
      书籍编号 <input type="radio" name="radio" value="bookid"> &nbsp;&nbsp;&nbsp;&nbsp;             
      书名   <input type="radio" name="radio" value="bookname"> &nbsp;&nbsp;&nbsp;&nbsp;             
      ISBN    <input type="radio" name="radio" value="isbn"> &nbsp;&nbsp;&nbsp;&nbsp;    
      <input name="sb" type="submit" value="查询借阅情况 ">           
      		</p>      
      	</form>      
      </div> 
   </body> 
</html> 
 