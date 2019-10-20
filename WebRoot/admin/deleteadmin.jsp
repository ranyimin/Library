<%@ page import="java.sql.ResultSet"%>
<%@ page import="admin.ConnDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<form action="deleteadmin2.jsp" method="post">
			<table border="1">
				<tr>
					<td>账号</td>
					<td>用户名</td>
					<td>删除</td>
				</tr>
				<%
					request.setCharacterEncoding("utf-8");
					String find = request.getParameter("find");
					String rd = request.getParameter("rd");
					out.print("<br>find=" + find + ",rd=" + rd);
					String sql = "select * from admin where" + rd + "like '%" + find + "%'";
					if ("".equals(find)) {
						//如果输入的空则自动返回查询页
						response.sendRedirect("alteradmin.html");
					} else {
						ConnDB conn = new ConnDB();
						ResultSet rs = conn.myExcuteQuary(sql);
						while (rs.next()) {
							String adminid = rs.getString("adminid");
							String name = rs.getString("name");
							String password = rs.getString("password");
							out.print("<br>" + adminid + "" + name + "" + password);
				%>
				<tr>
					<td><%=adminid%></td>
					<td><%=name%></td>
					<td><input type="checkbox" name="adminid" value=<%=adminid%> /></td>
				</tr>
				<%
					}
						rs.close();
						conn.close();
					}
				%>
				<tr>
					<td colspan="3" align="right"><input type="reset" name="reset"
						value="还原" /> <input type="submit" name="submit" value="提交删除" />
				</tr>
			</table>
		</form>
	</div>
</body>
</html>