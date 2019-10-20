<%@page import="java.sql.ResultSet"%>
<%@page import="reader.ReaderDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<jsp:useBean id="car" scope="request" class="reader.ReaderDB" />
	<form action="alterok.jsp" method="post">
		<table border="1">
			<tr>
				<td>id</td>
				<td>用户名</td>
				<td>性别</td>
				<td>联系电话</td>
				<td>密码</td>
			</tr>

			<%
	ReaderDB readerDB=new ReaderDB();
		String find = request.getParameter("find");
		//System.out.print(find+"/////////////////");
		String radio = request.getParameter("radio");
		//System.out.print(radio+"/////////////////");
       if(find==""){
		%>
			<script type="text/javascript">
            alert("查找不能为空，请重新输入");
            history.back("alterreader.html");

        </script>

			<%
				} else {
					if (radio.equals("1")) {

						String sql = "select * from reader where name like '%" + find + "%'";
					//	System.out.print(sql + "****************");
						ResultSet rs = car.find(sql);
						while (rs.next()) {
			%>

			<tr>
			<td><input type="text" value="<%=rs.getInt("id")%>"  name="id" readonly></td>
				<td><input type="text" value="<%=rs.getString("name")%>" name="name"></td>
				<td><input type="text" value="<%=rs.getString("sex")%>" name="sex"></td>
				<td><input type="text" value="<%=rs.getString("tel")%>" name="tel"></td>
				<td><input type="password" value="<%=rs.getString("pw")%>" name="pw"></td>

			</tr>
			<%
				}
					}
					if (radio.equals("2")) {

						String sql = "select * from reader where id like '%" + find + "%'";
					//	System.out.print(sql + "****************");
						ResultSet rs = car.find(sql);
						while (rs.next()) {
			%>

			<tr>
				<td><input type="text" value="<%=rs.getInt("id")%>"  name="id" readonly></td>
				<td><input type="text" value="<%=rs.getString("name")%>" name="name"></td>
				<td><input type="text" value="<%=rs.getString("sex")%>" name="sex"></td>
				<td><input type="text" value="<%=rs.getString("tel")%>" name="tel"></td>
				<td><input type="password" value="<%=rs.getString("pw")%>" name="pw"></td>

			</tr>

		
			<%
				}
					}
				}
			%>

		</table>
		<input type="submit" value="修改"> <a href="alterreader.html"><input
			type="button" value="返回"></a>
	</form>
</body>

</html>
