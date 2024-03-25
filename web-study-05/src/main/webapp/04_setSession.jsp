<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.setAttribute("id2", "test");
	session.setAttribute("pwd2", "test1234");
	session.setAttribute("age2", 20);
	//session은 따로 시간설정을 하지 않으면
	// 유지시간은 30분이다.
%>
<h1>섹션 설정</h1>

</body>
</html>