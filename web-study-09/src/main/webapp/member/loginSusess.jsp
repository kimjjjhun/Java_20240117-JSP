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
                <form id="login" action="" method="post" name="frm" class="input-group" >
                    <input type="button" value="메인메뉴" class="submit"
				onclick="location.href='main.do'"><br>
                
                    <input type="button" value="회원정보수정" class="submit"
				onclick="location.href='memberUpdate.do?userid=${loginUser.userid}'">
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
</body>
</html>