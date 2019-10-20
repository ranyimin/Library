<%@page import="java.sql.ResultSet"%>
<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");//设置request域的字符编码
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<jsp:useBean id="myBean" class="reader.ReaderDB" scope="page"></jsp:useBean>
<jsp:useBean id="admin" class="admin.ConnDB" scope="page"></jsp:useBean>
</head>

<body>
	<%
		response.setCharacterEncoding("utf-8");
	%>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String login = request.getParameter("gl");
		System.out.print(login+"***");
		if (id == "" || pw == "") {
	%>
	<script type="text/javascript">
		window.alert("输入不能为空，请重新输入");
		window.history.back("login.html");
	</script>
	<%
		}
		else{

		if (login.equals("0")) {
		  if (!admin.isadmin(id)) {
	%><script type="text/javascript">
		window.alert("账号不存在，请重新输入");
		window.history.back("login.html");
	</script>
	<%
		}

			else {
				String sql = "select * from admin where id='"+id+"'";
				ResultSet rs =admin.myExcuteQuery(sql);
				while (rs.next()) {
				  String id1 = rs.getString("id");
					String name = rs.getString("name");
					String pw1 = rs.getString("pw");
					System.out.print(pw1+"************");
					if (!pw.equals(pw1)) {
	%>
	<script type="text/javascript">
		window.alert("密码不正确，请重新输入");
		window.history.back("login.html");
	</script>
	<%
		} else {
		          session.setAttribute("id", id);
					session.setAttribute("name", name);
						response.sendRedirect("admin/admin.html");
						return;
					}
	%>
	<%
				}
			}
		
		}
		if (login.equals("1")) {
			if (!myBean.isUser(id)) {
	%><script type="text/javascript">
		window.alert("用户不存在，请重新输入");
		window.history.back("login.html");
	</script>
	<%
		}

			else {
				String sql = "select * from reader";
				ResultSet rs = myBean.find(sql);
				while (rs.next()) {
					String id1 = rs.getString("id");
					String name = rs.getString("name");
					String pw1 = rs.getString("pw");
					if (!pw.equals(pw1)) {
	%>
	<script type="text/javascript">
		window.alert("密码不正确，请重新输入");
		window.history.back("login.html");
	</script>
	<%
		} else {
							session.setAttribute("id", id);
							session.setAttribute("name", name);

							response.sendRedirect("reader/reader.html");
						}

					}
				}
			}
		}
	%>
</body>
</html>