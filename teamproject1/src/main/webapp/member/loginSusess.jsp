<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>환영합니다. 여긴 메인페이지 입니다.</h1>

<h1>어디로 이동할까요?</h1>
<a href="OttServlet?command=member_insert_form">회원가입</a><br>
<a href="javascript:history.back()">이전메뉴</a><br>
<a href="OttServlet?command=">마이페이지</a><br>
<a href="OttServlet?command=">회원정보수정</a><br>
 <%
			 
	session.setAttribute("member_mid", "5235268");
	response.sendRedirect("메인주소");
	%>

</body>
</html>