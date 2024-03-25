<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="login.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/member.js"></script>
<script>
    var message = "<%= request.getAttribute("message") %>";
    if(message && message.trim() !== "" && message !== "null") {
        alert(message);
    }
</script>
<script>
    var message = "<%= request.getAttribute("updateMessage") %>";
    if(message && message.trim() !== "" && message !== "null") {
        alert(message);
    }
</script>
</head>
<body>
<div class="container" id="container">
  <div class="form-container sign-in-container">
    <form action="login.do" method="post" name="frm">
      <h1>로그인</h1>
      <div class="social-container">
        <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
        <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
        <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
      </div>
      <input type="text" placeholder="아이디" name="userid" />
      <input type="password" placeholder="비밀번호" name="pwd" />
      <a href="#"><ins>비밀번호를 잊어버리셨나요?</ins></a>
      <button>로그인</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1>Welcome Back!</h1>
        <button class="ghost" id="signIn">Sign In</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1>넷플릭스에 오신걸 환영합니다!</h1><br><br><br><br>
        <p><b>처음 접속하신 이용자이시면 회원가입을 먼저 진행해주세요.</b></p>
        <button class="ghost" id="signUp" button value="회원 가입" onclick="location.href='join.do'">회원가입</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>