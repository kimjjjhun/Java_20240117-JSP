<%@page import="java.net.URLEncoder"%>
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
	String id = "test";
	String pw = "1234";
	/*String name="korea";*/ 
    String name="홍길동";
	String id2 = request.getParameter("id");
	String pw2 = request.getParameter("pw");
	
	request.setCharacterEncoding("utf-8");
	if(id.equals(request.getParameter("id")) && 
			pw.equals(request.getParameter("pw"))){
		response.sendRedirect("04_main.jsp?name=" + URLEncoder.encode(name, "utf-8"));
		/*response.sendRedirect("04_main.jsp?name=" + name);*/
	}else{
		response.sendRedirect("04_loginForm.jsp");
	}
%>

</body>
</html>