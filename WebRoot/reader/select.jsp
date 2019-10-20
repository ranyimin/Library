<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="reader.ReaderDB"></jsp:useBean>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<style type="text/css">
#div1 {
	background: #FFF;
	text-align:center;
}
</style>
</head>

<body>
    <div id="div1">
	<form action="selectbook.jsp" method="post">
	查找图书：<input type="text" name="find">
	          ISBN:<input type="radio" name="radio"   value="0">
	           书名:<input type="radio" name="radio" value="1" checked="checked">
	           <input type="submit" name="tj" value="查询">
	</form>
        </div>
</body>
</html>
