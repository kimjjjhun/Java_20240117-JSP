<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- login.css를 사용하기위한 링크 -->
<link rel="stylesheet" href="css/login.css">
<!-- 카카오로그인 -->
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- member.js 스크립트를 외부에서 가져옴 -->
<script src="script/member.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type='text/javascript'>

Kakao.init('a79db61fe2fb1cd6a09cacf6f63ac3fe');


$("#kakao-login-btn").on("click", function(){
    //1. 로그인 시도
    Kakao.Auth.login({
        success: function(authObj) {
         
          //2. 로그인 성공시, API 호출
          Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
              console.log(res);
              var id = res.id;
			  scope : 'account_email';
			alert('로그인성공');
              location.href="callback주소";
		

              
        }
          })
          console.log(authObj);
          var token = authObj.access_token;
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
        
}) //


</script>

<title>Insert title here</title>
</head>
<body>
<!-- 로그인 폼 -->
	<main>
		<div class="loginWrap">
			<h1>로그인</h1>

			<form action="OttServlet" method="post" name="frm">
			<input type="hidden" name = "command" value="member_login">
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
				<a href="OttServlet?command=member_insert_form">회원가입</a> <a href="OttServlet?command=member_findid_form">아이디 찾기</a>
			</div>
			
			      <div class="button-login" align ="center" >
                <a id="kakao-login-btn" >
    <img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="83%" height ="50px" />
    </a>
    <a href="http://developers.kakao.com/logout">카카오 로그아웃</a>
            </div>
			
		</div>
	</main>
</body>
</html>

