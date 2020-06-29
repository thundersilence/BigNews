<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>日志</title>
</head>
<body>
	<a href="secret">返回</a>
	<pre>
		${requestScope.record}
	</pre>
</body>
</html>