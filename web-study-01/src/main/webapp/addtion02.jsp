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

int num1 = 10;
int num2 = 20;
int add = num1+num2;
String name = "김정훈";
int age = 31;
int ran = (int)(Math.random()*10)+1;
%>
<%= num1 %> + <%= num2 %> = <b><%= add %></b>
<h1>이름 : <b><%= name %></b></h1>
<h2>나이 : <b><%= age %></b></h2>
<h3>랜덤 : <b><%= ran %></b></h3>
</body>
</html>