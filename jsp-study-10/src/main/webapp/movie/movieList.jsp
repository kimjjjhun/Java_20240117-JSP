<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/shopping.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div id="wrap" align="center">
<h1>리스트</h1>
<table class="list">
   <tr>
     <td colspan="6" style="border: white; text-align: right"> 
       <a href="moviewrite.do" >정보등록</a>      
     </td> 
   </tr> 
   <tr><th>제목</th><th>감독</th><th>배우</th><th>가격</th><th>수정</th><th>삭제</th></tr>
   <c:forEach items="${movieList}" var="movie">
   <tr class="record">
     <td>${movie.title}</td>
     <td>${movie.director }</td>
     <td>${movie.actor }</td>
     <td style="text-align: right; ">${movie.price } 원</td>
     <td>
       <a href="movieupdate.do?code=${movie.code }">정보 수정</a>
     </td>
     <td>
       <a href="moviedelete.do?code=${movie.code }">정보 삭제</a>
    </td>
   </tr>
   </c:forEach>
</table>
</div>
</body>
</html>