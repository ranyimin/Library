<%@page import="java.sql.ResultSet" %>
<%@page import="db.Conndb" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC"-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改图书</title>
</head>

<body>
   <div align="center">
      <p>请输入您要修改的信息的基本情况进行查询,注意查询的选择</p><br>
      <form action="" method="post" name="form1">
      <label>请输入您要查询的信息:</label>
      <input type="text" name="find" id="find">
      <input type="radio" name="fd" value="bookname" id="fd_2" checked="checked">
          书名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="fd" value="id" id="fd_0">
       id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="fd" value="ISBN" id="fd_1">
      ISBN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br><br><br><br><br>
      <input type="submit" name="submit1" value="查询" ><br>
      </form>
      
      <form action="alterbook2.jsp" method="post" name="form2">
        <%
           String sb="";
           String find="";
           String fdtype="";
           sb=request.getParameter("submit1");
           String sql="select * form Book";
           if(!(sb==null ||"".equals(null))){
              find=request.getParameter("find");
              fdtype=request.getParameter("fd");
           }
           if(fdtype.equals("bookname")){
              sql=sql+"where bookname like '%"+find+"%'";
              out.print("<br>"+sql+"<br>");
           }
           if(fdtype.equals("id")){
              sql=sql+"where bookid like '%"+find+"%'";
              out.print("<br>"+sql+"<br>");
           }
           if(fdtype.equals("ISBN")){
              sql=sql+"where ISBN like '%"+find+"%'";
              out.print("<br>"+sql+"<br>");
           }
           
           Conndb conndb=new Conndb();
           ResultSet rs=conndb.myExcuteQuary(sql);
           out.print("<table border='0' width='90%'>");
           int i=0;
           while(rs.next()){
              String bookid=rs.getString("bookid");
              String ISBN=rs.getString("ISBN");    
              String bookname=rs.getString("bookname");
              float price=rs.getFloat("price");
              String statei="state"+bookid;        
          
           %>
           <tr>
              <td><%=bookid %><input name="bookid" type="hidden" value=<%=bookid %>></td>
              <td><input name="bookname" type="text" value=<%=bookname %>></td>
              <td><input name="price" type="text" value=<%=price %>></td>
              <td><input name="ISBN" type="text" value=<%=ISBN %>></td>
                     
         <%
             String state=rs.getString("state");
             if(state.equals("已还")){
          %>    
             <td><input name=<%=statei%> type='radio' value='已还' checked="checked"/>已还</td>
             <td><input name=<%=statei%> type='radio' value='已借'>已借</td>
          
          <% }
          else{
          %>
             <td><input name=<%=statei%> type='radio' value='已还' >已还</td>
             <td><input name=<%=statei%> type='radio' value='已借' checked="checked"/>已借</td>
           </tr>
           
           <%
           }
           %>
          
            <tr>
               <td colspan="7" align="right"></td>
               <td><br><br><input type="submit" value="提交"></td>
            </tr>
            out.print("</table>");
            <%
             
              rs.close();
             conndb.close();
              }
              
             %>
          
          
      </form>
    </div>
</body>
</html>