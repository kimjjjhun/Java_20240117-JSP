<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 세션을 이용하여 loginuser 값을 저장 -->
<%
String name = (String)session.getAttribute("loginUser");
String id = (String)session.getAttribute("id");
%>
<!-- 세션에 저장된 name , id값 출력 -->
<p>이름: <%= name %></p><br>
<p>아이디: <%= id %></p><br>

<!-- 버튼4개 구현 -->
<input type="button" value="개인정보 변경" onclick="location.href='10_edit.jsp'">
<input type="button" value="작성 게시글" onclick="location.href='10_Post.jsp'">
<input type="button" value="찜 목록" onclick="location.href='10_wishlist.jsp'">
<input type="button" value="이전페이지" onclick="location.href='10_main.jsp'">

</body>
</html>