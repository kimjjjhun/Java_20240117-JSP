<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	td{ border: 1px solid black;
		width: 200px;
		text-align: center;}
	td a{
	text-decoration: none;}
	
	
</style>
</head>
<body>
	<table>
		<c:if test="${empty loginUser}">
				<a href="login.do">로그인</a>
				사원등록<br> 
				<span style="color: red;">(관리자로
						로그인 후 사용 가능)</span>
				마이페이지<br> <span style="color: red;">(로그인 후
						사용가능)</span>
			
		</c:if>
		<c:if test="${!empty loginUser}">
		<tr>
			<!-- 로그인유저에 있는정보로 출력시킨다. -->
			<td>${loginUser.name}님 반갑습니다</td>
			<td><a href="logout.do">로그아웃</a></td>
			<td>
				<c:if test="${result==2}">
					<td><a href="custom.do">사원등록</a></td>
				</c:if>
				
				<c:if test="${result==3}">
					<td>
					사원등록<br>
					<span style="color: red;">(관리자로 로그인 후 사용가능)</span>
					</td>
				</c:if>
			</td>
			<td><a href="mypage.do">마이페이지</a></td>
		</tr>
		</c:if>
	</table>
	<br>

</body>
</html>