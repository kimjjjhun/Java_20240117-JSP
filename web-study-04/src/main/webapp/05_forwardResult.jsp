<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
<%
	int age = Integer.parseInt(request.getParameter("age"));
	String name = (String)request.getAttribute("name");
%>

forword 방식으로 이동된 페이지<br>
나이 :<B> <%=age %> </B>
이름 :<B> <%=name %> </B>


</body>
</html>