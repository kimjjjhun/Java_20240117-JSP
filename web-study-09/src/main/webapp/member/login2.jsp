<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="login2.css"/>
<title>Insert title here</title>
<script type="text/javascript"></script>
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
<div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()" >로 그 인</button>
                    <button type="button" class="togglebtn" onclick="register()">내 정 보</button>
                </div>
                <div class="social-icons">
                    <img src="img/fb.png" alt="facebook">
                    <img src="img/tw.png" alt="twitter">
                    <img src="img/gl.png" alt="google">
                </div>
                <form id="login" action="login2.do" method="post" name="frm" class="input-group" >
                    <input type="text" class="input-field" placeholder="User ID" required name="userid">
                    <input type="password" class="input-field" placeholder="User Password" required name="pwd">
                    <input type="checkbox" class="checkbox"><label class="checkbox-label">비밀번호 기억하기</label>
                    <br>
                    <div class="forgot-password">
    <a href="#" class="forgot-link"><ins>비밀번호를 잊어버리셨나요?</ins></a>
</div>
                    <button class="submit">로 그 인</button><br>
                	<button class="signUp" id="signUp" value="회원 가입" onclick="location.href='join.do'">회원가입</button>
                </form>
                <form id="register" action="" class="input-group">
                    <input type="button" value="회원정보수정" class="submit"
				onclick="location.href='memberUpdate.do?userid=${loginUser.userid}'">
                </form>
                <form>
                </form>
            </div>
        </div>
        <script>
        var x = document.getElementById("login");
        var y = document.getElementById("register");
        var z = document.getElementById("btn");
function login(){
            x.style.left = "50px";
            y.style.left = "450px";
            z.style.left = "0";
        }
function register(){
            x.style.left = "-400px";
            y.style.left = "50px";
            z.style.left = "110px";
            alert("로그인 후 사용가능합니다.");
        }

</script>
<footer class="footer">
<div>이 페이지는 팀 프로젝트 페이지입니다.<br>잘 부탁 드립니다.</div>
</footer>
</body>
</html>