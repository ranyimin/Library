<%@page import="admin.ConnDB"%>
<%@ page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	还书信息
	<%
	int updatebook = 0;
	int updatareturn = 0;
	String readerid = request.getParameter("readerid");
	String bookid = request.getParameter("bookid");
	String sqlreader = "select * from reader where id='" + readerid + "'";
	String sqlbookid = "select * from book where bookid='" + bookid + "' and state='已借'";
	String sqlreturnselect = "select * from lendreturn where bookid='" + bookid + "' and id='" + readerid
			+ "'and state='已借'";
	out.print("<br>" + sqlreader);
	out.print("<br>" + sqlbookid);
	out.print("<br>" + sqlreturnselect);
	ConnDB conn = new ConnDB();
	ResultSet rsbook = conn.myExcuteQuary(sqlbookid);
	ResultSet rsreader = conn.myExcuteQuary(sqlreader);
	ResultSet rsreturnselect = conn.myExcuteQuary(sqlreturnselect);
	String bookname = "";
	String bookstate = "";
	while (rsbook.next()) {
		bookname = rsbook.getString("bookname");
		bookstate = rsbook.getString("state");
		out.print("<br>书籍信息：图书编号：&nbsp;&nbsp;" + bookid + ",图书名称：&nbsp;&nbsp;" + bookname + ",图书状态：&nbsp;&nbsp;"
				+ bookstate);

	}

	String readername = "";
	while (rsreader.next()) {
		readername = rsreader.getString("name");
		out.print("<br>读者编号：" + readername + ", 读者姓名：" + readername);
	}
	int autoid = 0;
	while (rsreturnselect.next()) {
		autoid = rsreturnselect.getInt("autoid");
		if (autoid != 0) {
			out.print("<br>autoid:" + autoid + ",readerid:" + rsreturnselect.getString("id") + ",bookid:"
					+ rsreturnselect.getString("bookid"));
		} else {
			out.print("<br>为查找到相关的借书未还记录");
		}
	}
	if (autoid != 0) {
		String sqlupdatebook = "update book set state='已还' where bookid='" + bookid + "'";
		String sqlupdatereturn = "update lendreturn set state='已还',returntime=getdate() where autoid=" + autoid;
		out.print("<br>sqlupdatebook:" + sqlupdatebook);
		out.print("<br>sqlpdatereturn:" + sqlupdatereturn);

		updatebook = conn.myExcuteUpdate(sqlupdatebook);
		updatareturn = conn.myExcuteUpdate(sqlupdatereturn);
	}
	rsbook.close();
	rsreader.close();
	rsreturnselect.close();
	conn.close();
	if (updatebook != 0 && updatareturn != 0) {
		out.print("<script type='text/javascript'> window.alert('还书成功');window.history.back();</script>");
	}
%>
</body>
</html>