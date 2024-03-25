<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	pageContext2 : <%=pageContext.getAttribute("name") %> <br>
	
	request2 : <%=request.getAttribute("name") %> <br>
	
	session2 : <%=session.getAttribute("name") %> <br>
	
	application2 : <%=application.getAttribute("name") %> <br>
</body>
</html>