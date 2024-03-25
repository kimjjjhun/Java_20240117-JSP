<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl을 사용하기위해서는 lib에 jstl , standard 넣기 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.println("Hello world");
%>
<br>
<!-- out 프린트를 jstl로 간결하게 사용가능 -->
<c:out value="Hello world"></c:out>

</body>
</html>