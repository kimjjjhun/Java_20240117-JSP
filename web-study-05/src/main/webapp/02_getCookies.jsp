<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>클라이언트로 얻어온 Cookie</h3>
<%
	// 쿠키에 저장된값이 하나가 아닐경우에는 객체배열로 불러온다.
	Cookie[] cookiess = request.getCookies();
	// 향상된포문으로 쿠키에 저장된값이 있는만큼 불러온다.
	for(Cookie cookie : cookiess )
		out.println(cookie.getName() +": "+
	cookie.getValue() +  "<br>");
		
%>
</body>
</html>