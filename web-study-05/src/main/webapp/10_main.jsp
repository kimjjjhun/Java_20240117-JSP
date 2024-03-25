<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("loginUser")==null){
	response.sendRedirect("10_loginForm.jsp");
}else{
%>

<%=session.getAttribute("loginUser") %>님 안녕하세요!<br>
	넷플릭스에 방문해 주셔서 감사합니다.<br>
	즐거운 시간 되세요<br>
	<form method="post" action="10_logout.jsp">
	<input type="submit" value="로그아웃"></form>
	<form method="post" action="10_mypage.jsp">
	<input type="submit" value="마이페이지"></form>
	<form method="post" action="10_posting.jsp">
	<input type="submit" value="글 작성"></form>
	<form method="post" action="10_qna.jsp">
	<input type="submit" value="Q&A"></form>
	
	<%
}
	%>
</body>
</html>