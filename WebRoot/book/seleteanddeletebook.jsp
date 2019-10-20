<%@page import="java.sql.ResultSet"%>
<%@page import="db.Conndb"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>查询并删除图书</title>
</head>
<body>
   <div align="center">
     <p>请输入您要修改的信息的基本情况进行查询，注意查询项的选择</p>
     <form name="form1" method="post" action="">
       <label for="find"> 请输入您要查询的信息:</label>
       <input type="text" name="find" id="find">
       <input type="radio" name="fd" value="bookname" id="fd_2" checked="checked">
            书名&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="fd" value="id" id="fd-0">
          id&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="radio" name="fd" value="ISBN" id="fd-1">
          ISBN&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="submit1" type="submit" value="查询">
          <br>
                  
     </form>
     <form action="deletebook.jsp" method="post" name="form2">
     <%
       String sb="";
       String find="";
       String fdtype="";
       sb=request.getParameter("submit");
       String sql="select * from Book";
       if(sb==null||"".equals(null)){
         find=request.getParameter("find");
         fdtype=request.getParameter("fd");
         out.print("测试 "+find+" "+fdtype+"<br>");
         if(find==null||"".equals(find)){
           out.print("<script type='text/javascript'>window.alert('查找的值不能为空')</script>");
         }else{
           if(fdtype.equals("bookname")){
             sql=sql+"where bookname like'%"+find+"%'";
             out.print("<br>"+sql+"<br>");
           }        
           Conndb conndb=new Conndb();
           ResultSet rs=conndb.myExcuteQuary(sql);
           out.print("<table border='1' width='98%'>");
           out.print("<tr><td>编号</td><td>书名</td><td>价格</td><td>ISBN</td></tr>");
           while(rs.next()){
             String bookid=rs.getString("bookid");
             String bookname=rs.getString("bookname");
             float price=rs.getFloat("price");
             String ISBN=rs.getString("ISBN");
             %>
             <tr>
                 <td><%=bookid %></td>
                 <td><%=bookname %></td>
                 <td><%=price%></td>
                 <td><%=ISBN%></td>
                 <td><input name="id" type="checkbox" value=<%=rs.getString("bookid") %>></td>
                                  
             </tr>
           <%  
           }
           %>
           <tr>
              <td colspan="7" align="right">
                 <br><br><input type="submit" value="提交">
              </td></tr>
              <% 
                out.print("</table>");
                rs.close();
                conndb.close();
                       }
       }
     %>
     <p>&nbsp;</p>
     </form>
   </div>
</body>
</html>