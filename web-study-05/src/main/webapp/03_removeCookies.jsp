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
	//저장된 쿠키값 id 삭제
	Cookie cookie = new Cookie("id","");
	//유효기간을 0으로 두면서 바로 삭제시킨다.
	cookie.setMaxAge(0); 
	response.addCookie(cookie);
	
	//저장된 쿠키값 age 삭제
	cookie = new Cookie("age","");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
%>

</body>
</html>