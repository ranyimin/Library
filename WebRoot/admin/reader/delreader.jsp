<%@page import="java.sql.*"%>
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
    <form action="delrader1.jsp" method="post">
        <table border="1">
            <tr>
                <td>id</td>
                <td>用户名</td>
                <td>性别</td>
                <td>删除</td>
            </tr>


            <%
			Statement statm = null;
			String sql = "select * from reader";

			ResultSet rs = rdb.find(sql);
			while (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				String sex = rs.getString("sex");
				String pw = rs.getString("pw");
		%>

            <tr>
                <td><%=id%></td>
                <!--//readonly="true"不可编辑  -->
                <td>
                    <%=name%>
                </td>
                <td>
                    <%=sex%>
                </td>
                <td><input type="checkbox" name="id" value="<%=id%>"></td>


            </tr>

            <%
			}
		%>
            <input type="submit" value="删除">
            <a href="admin/admin.html"> <input type="button" value="取消"></a>
        </table>
    </form>
</body>

</html>
