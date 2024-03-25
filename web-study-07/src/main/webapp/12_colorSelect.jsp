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
	int color = Integer.parseInt(request.getParameter("color"));
	if(color == 1 ){
%>
		<h1 style="background=color: red">빨강</h1>
<%
	}else if(color == 2 ){
%>
		<h1 style="background=color: blue">파랑</h1>
<%
	}else if(color == 3 ){
%>
		<h1 style="background=color: yellow">노랑</h1>
<% 	
	}
%>

</body>
</html>