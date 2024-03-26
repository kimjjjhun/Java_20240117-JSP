<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglibprefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- login.css를 사용하기위한 링크 -->
<link rel="stylesheet" href="css/Login.css">

<!-- member.js 스크립트 -->
<script src="script/Member.js"></script>
<!-- jquery 스크립트 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 폼 -->
	<main>
		<div class="loginWrap">
			<h1>로그인</h1>

			<form action="OttServlet" method="post" name="frm">
				<input type="hidden" name="command" value="member_login">
				<div class="loginFormBox">
					<input type="text" name="userid" placeholder="아이디를 입력하세요"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '아이디를 입력하세요'">
				</div>
				<div class="loginFormBox">
					<input type="password" name="pwd" placeholder="비밀번호를 입력하세요"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '비밀번호을 입력하세요'">
				</div>

				<div class="pwdFind">
					<a href="OttServlet?command=member_findpw_form">비밀번호 찾기</a>
				</div>

				<button class="loginBtn" onclick="loginCheck()">로그인</button>
			</form>

			<div class="joinAndEmailFind">
				<a href="OttServlet?command=member_insert_form">회원가입</a> <a
					href="OttServlet?command=member_findid_form">아이디 찾기</a>
			</div>

			<div></div>
	</main>
</body>
</html>


