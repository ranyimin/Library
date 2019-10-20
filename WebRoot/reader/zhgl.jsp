<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	response.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="db" class="reader.ReaderDB"></jsp:useBean>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>账户管理</title>
    <style type="text/css">
        #div1 {
          
            font-size: 16px;
            color: #F66;
            background: center center;
            
        }
body{
    background-color: blanchedalmond;
	}
    </style>
</head>

<body>

    <%@ include file="tool.jsp"%>
    <!-- 引用tool里面的id -->

    <%
		String id1 = (String) session.getAttribute("id");

		String sql = "select * from reader where id=" + id1 + "";

		ResultSet rs = db.find(sql);
		while (rs.next()) {
			String id2 = rs.getString("id");
			String name1 = rs.getString("name");
			String pw = rs.getString("pw");
	%>
    <center>
        <div id="div1">
            <table border="1">
                <caption>我的信息</caption>

                <tr>
                    <td>id</td>
                    <td>姓名</td>
                    <td>密码</td>
                </tr>
                <tr>
                    <td>
                        <%=id2%>
                    </td>
                    <td>
                        <%=name1%>
                    </td>
                    <td>
                        <%=pw%>
                    </td>

                </tr>

            </table>



            <a href="alterpw.jsp"><button>修改密码</button></a>
        </div>
    </center>
    <%
		session.setAttribute("pw", pw);
			session.setAttribute("id", id);
			session.setAttribute("name", name1);

		}
	%>
</body>

</html>
