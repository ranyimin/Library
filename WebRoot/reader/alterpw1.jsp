
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="reader.ReaderDB"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="alterpw.jsp"%>
	<%
		Object id1 = session.getAttribute("id");
		Object pw4 = session.getAttribute("pw");
		String pw1 = request.getParameter("pw1");
		String pw2 = request.getParameter("pw2");
		String pw3 = request.getParameter("pw3");
	%>


	<%
		if (pw1 == "" || pw2 == "" || pw3 == "") {
	%>
	<script type="text/javascript">
		window.alert("输入不能为空，请重新输入!!");
		window.history.back("alterpw.jsp");
	</script>
	<%
		} else {
			if (!pw4.equals(pw1)) {
	%><script type="text/javascript">
		window.alert("输入的原密码不匹配，请重新输入!!");
		window.history.back("alterpw.jsp");
	</script>
	<%
		}
			if (!pw2.equals(pw3)) {
	%><script type="text/javascript">
		window.alert("输入的新密码不匹配，请重新输入!!");
		window.history.back("alterpw.jsp");
	</script>
	<%
		}
			if (pw4.equals(pw1) && pw2.equals(pw3)) {
				String sql = "update  reader set pw=" + pw3 + " where id=" + id1 + "";
				System.out.print(sql + "***");
				db.altermypw(sql);
			}
	%>
	<script type="text/javascript">
		window.alert("修改成功!!");
		window.history.back("reader.html");
	</script>
	<%
		}
	%>

</body>
</html>