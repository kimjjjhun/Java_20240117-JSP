<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- pageContext는 페이지를 벗어나면 사용할수없다. -->
	pageContext : <%=pageContext.getAttribute("name") %> <br>
	
	request : <%=request.getAttribute("name") %> <br>
	
	session : <%=session.getAttribute("name") %> <br>
	
	application : <%=application.getAttribute("name") %> <br>
	
	<a href="07_thirdPage.jsp">서드페이지</a>

</body>
</html>