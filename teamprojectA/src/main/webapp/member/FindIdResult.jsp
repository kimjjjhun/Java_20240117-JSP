<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/Login.css">
<script src="script/Member.js"></script>
<title>Insert title here</title>
</head>
<body>

<!-- 아이디 찾기 성공 확인 폼 -->
	<main>
		<div class="loginWrap">
			<h1>아이디 조회 결과</h1>
			<form action="OttServlet" method="post" name="frm">
				<div class="loginFormBox">
					<h2 style="text-align: center;">회원가입 시 사용한 아이디는 <p style="color: red;"><Strong>${userId}</Strong></p>입니다.</h2>
				</div>
				
				<div class="signBtn" style="text-align: center;">
					<input type="button" class="fa-solid fa-mobile-screen-button"
						value="로그인하러가기" onclick="goToLoginPage()">
				</div>
			</form>
		</div>
	</main>

</body>
</html>
<!-- 로그인하러가기 버튼 클릭시 화면으로 이동 -->
<script>
    function goToLoginPage() {
        window.location.href = "OttServlet?command=member_login_form"; // 로그인 페이지의 경로를 설정합니다.
    }
</script>