<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "param.js"></script>
</head>
<body>

<form name="frm" action="ParamServlet">
아이디 : <input type="text" name="id" value="아이디"> <br>
암&nbsp;&nbsp;호 : <input type="text" name="pass" value="비밀번호"> <br>

<input type="submit" value="로그인" onclick="return check()">
</form>

</body>
</html>