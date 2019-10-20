<%@page import="db.Conndb"%>
<%@page import="java.sql.ResultSet"%> 
<%@page import="db.Conndb"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>     
<% request.setCharacterEncoding("utf-8"); %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
 
 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<title>Insert title here</title> 
</head> 
<body> 
<!-- 先得到 bookid 在数据库中查询  如果数据库中已经有数据则返回到上一页  否则添加数据库   -->  
<%    
	String bookid=request.getParameter("bookid");  
	//有可能管理员忘记输入 bookid 了 返回上一页  
	if(bookid==null||bookid.equals("")){    
	%>   
		<script type="text/javascript">    
			window.alert("您还没有输入书籍编号！！！");    
			window.history.back();   
		</script>  
	<%    
	}  
	String bookname=request.getParameter("bookname");  
	float  price=0;  
	try{   
		price= Float.parseFloat(request.getParameter("price"));  
	}catch(Exception e){  
	%>   
		<script type="text/javascript">    
		window.alert("书籍的价格必须是数值，您的输入有误");    
		window.history.back();   
		</script>  
	<%  
	}  
	String ISBN=request.getParameter("ISBN");  
	System.out.print(ISBN);  //数据库检索是否有相同的 ISBN  
	
	String sql="select count(*)from Book where bookid='"+bookid+"'";  
	Conndb conndb=new Conndb();  
	ResultSet rs=conndb.myExcuteQuary(sql);
	int count =0; 
	if(rs.next()){   
		count=rs.getInt(1);  
	}  //如果 count=1 则说明有数据  count =0 则数据库中无此 id 可以插入  
	if(count==0){   
		sql="insert into Book(bookid,bookname,price,isbn) values('";   
		//构造 insert 语句   
		sql=sql+bookid+"','"+bookname+"',"+price+",'"+ISBN+"')";   
		System.out.print(sql);   
		conndb.myExcuteUpdate(sql);   
		session.setAttribute("dis", "书籍添加成功，请继续添加书籍");   
		response.sendRedirect("addbook.jsp");  
	}else{  
	%>  
	<script type="text/javascript">    
		window.alert("您输入书籍编号有重复，将会返回上一页，请重新输入编号");    
		window.history.back();   
		</script>  
	<%  
	}  
%> 
</body> 
</html> 