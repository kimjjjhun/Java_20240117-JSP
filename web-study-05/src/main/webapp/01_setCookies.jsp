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
	//1.Cookie 객체 생성
	Cookie cookie = new Cookie("id", "pinksung");
    
	//2. 유효기간 설정
	cookie.setMaxAge(24*60*60);
	
	//3. 클라이언트 쿠키 전송
	response.addCookie(cookie);
	response.addCookie(new Cookie("pwd","test1234"));
	response.addCookie(new Cookie("age","20"));
%>
<h1>쿠키 설정</h1>
</body>
</html>