<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/header.css">
<title>Insert title here</title>
</head>
<body>
   <div id="header">
      <input type="image" name="logo" src="images/logo.png">
   <div id="menu" align="left">
      <ul>
         <li><a href="#">컨텐츠</a></li>
         <li><a href="#">게시판</a></li>
         <li><a href="#">Q&A</a></li>
      </ul>
   </div>
   </div>
   <div id="profile">
      <c:choose>
      <c:when test="${!empty member.userid}">
         <c:if test="${member.admin == 1}">
            <input type="image" src="images/profile4.png" onclick="location.href='OttServlet?command=admin_menu'">
         </c:if>
         <c:if test="${member.admin == 0 }">
            <input type="image" src="images/profile3.png" onclick="location.href='#'">
         </c:if>
      </c:when>
      <c:when test="${empty member.userid}">
      <div class="login"><a href="#">로그인이 필요합니다</a></div> 
      </c:when>
      </c:choose>
   </div>
</body>
</html>