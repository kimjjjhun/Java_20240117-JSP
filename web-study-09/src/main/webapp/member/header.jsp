<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<table>
	<c:if test="${!empty loginUser}">
	<td>${loginUser.name}님 반갑습니다</td>
		<td><a href="logout.do">로그아웃</a></td>
	</c:if>
	
	</table>
</body>
</html>