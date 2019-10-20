<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="rdb" class="reader.ReaderDB" scope="page"></jsp:useBean>
	<%
		//String id = request.getParameter("id");
		String id[] = request.getParameterValues("id");
		if (id != null) {
			for (int i = 0; i <id.length; i++) {
				String sql = "delete from reader where id='" + id[i] + "'";
				System.out.print(sql+"///////////////");
				rdb.del(sql);

			}
			
		}
	%>

</body>
</html>