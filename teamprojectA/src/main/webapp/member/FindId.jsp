<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/Login.css">
<!-- member.js 유효성검사를 하기위한 스크립트 -->
<script src="script/Member.js"></script>
<title>Insert title here</title>
</head>
<body>

<!-- ID찾기 폼 -->
	<main>
		<div class="loginWrap">
			<h1> 아이디 찾기 </h1>

			<form action="OttServlet" method="post" name="frm">
				<input type="hidden" name="command" value="member_findid">
				<div class="loginFormBox">
					<input type="text" name="name" placeholder="이름을 입력하세요"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '이름을 입력하세요'">
				</div>
				
				<div class="loginFormBox">
					<input type="text" name="email" placeholder="이메일을 입력하세요"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = '이메일을 입력하세요'">
				</div>
				
				<!-- 찾기 버튼 -->
				
				<div class="signBtn" style="text-align: center;">
					<input type="submit" class="fa-solid fa-mobile-screen-button"
						value="S E A R C H" onclick="return searchCheck()">
				</div>
				
				<!-- 뒤로가기버튼 -->
				
				<div class="signBtn" style="text-align: center;">
					<input type="button" class="fa-solid fa-mobile-screen-button"
						value="뒤 로 가 기" onclick="history.back()">
				</div>
			</form>
		</div>
	</main>
</body>
</html>
