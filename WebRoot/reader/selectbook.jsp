<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="reader.ReaderDB"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        body {
            text-align: center;
            background-color: beige;
            
        }

    </style>
</head>

<body>
    <center>
        <%
		String find = request.getParameter("find");
		String radio = request.getParameter("radio");
		System.out.print(radio + "******<br>");
		if (find == "") {
	%>
        <script type="text/javascript">
            window.alert("查找的内容不能为空，请重新输入");
            window.history.back("select.jsp");

        </script>
        <%
			} else {
				if (radio.equals("0")) {
					String sql = "select * from book where ISBN like'%" + find + "%'";
					System.out.print(sql + "******");
					ResultSet rs = db.selectbook(sql);
					while (rs.next()) {
						String bookid = rs.getString("bookid");
						String ISBN = rs.getString("ISBN");
						String name = rs.getString("bookname");
						String price = rs.getString("price");
						String press = rs.getString("press");
						String state = rs.getString("state");
						String author = rs.getString("author");
		%>

        <table border="1"><caption>图书信息</caption>
            <tr>
                <td>bookid</td>
                <td>ISBN</td>
                <td>书名</td>
                <td>价格</td>
                <td>出版社</td>
                <td>状态</td>
                <td>作者</td>
            </tr>
            <tr>
                <td>
                    <%=bookid%>
                </td>
                <td>
                    <%=ISBN%>
                </td>
                <td>
                    <%=name%>
                </td>
                <td>
                    <%=price%>
                </td>
                <td>
                    <%=press%>
                </td>
                <td>
                    <%=state%>
                </td>
                <td>
                    <%=author%>
                </td>
            </tr>
        </table>
        <%
			}
				}

				if (radio.equals("1")) {
					String sql = "select * from book where bookname like'%" + find + "%'";
					ResultSet rs = db.selectbook(sql);
					while (rs.next()) {
						String bookid = rs.getString("bookid");
						String ISBN = rs.getString("ISBN");
						String name = rs.getString("bookname");
						String price = rs.getString("price");
						String press = rs.getString("press");
						String state = rs.getString("state");
						String author = rs.getString("author");
		%>
        <table border="1"><caption>图书信息</caption>
            <tr>
                <td>id</td>
                <td>ISBN</td>
                <td>书名</td>
                <td>价格</td>
                <td>出版社</td>
                <td>状态</td>
                <td>作者</td>
            </tr>
            <tr>
                <td>
                    <%=bookid%>
                </td>
                <td>
                    <%=ISBN%>
                </td>
                <td>
                    <%=name%>
                </td>
                <td>
                    <%=price%>
                </td>
                <td>
                    <%=press%>
                </td>
                <td>
                    <%=state%>
                </td>
                <td>
                    <%=author%>
                </td>
            </tr>
        </table>
        <%
			}
				}
			}
		%>
        <a href="select.jsp">
            <button>返回上一页</button>
        </a>
    </center>

</body>

</html>
