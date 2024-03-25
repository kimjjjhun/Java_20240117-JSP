<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="join.css?after"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<form action="join.do" method="post" name="frm" class="joinForm">
			 <div class="textForm">
				<input type="text" name="name" class="name" placeholder="이름입력">
				<select name="gender" style="float:left;">
    			<option value="">성별 선택</option>
    			<option value="남">남</option>
    			<option value="여">여</option>
				</select>
			</div>
			<div class="textForm">
				
				<input type="text" name="nickname" class="nickname" placeholder="닉네임입력">
			</div>
				
			<div class="textForm">
				<input type="text" name="userid" id="userid" class="id" placeholder="아이디입력">
				<input type="button" value="중복 체크" onclick="idCheck()" class="checkbtn">
				<input type="hidden" name="reid"> 
			</div>
			<div class="textForm">
				
				<input type="password" name="pwd" class="pw" placeholder="비밀번호입력">
			</div>
			<div class="textForm">
				
				<input type="password" name="pwd_check" class="pw" placeholder="비밀번호재입력">
			</div>
			<div class="textForm">
				
				<input type="text" name="email" class="email" placeholder="이메일입력">
			</div>
			<div class="textForm">
				<input type="text" name="cellPhone" id="cellPhone" 
				placeholder="핸드폰번호 입력 예)010-0000-0000" maxlength="13" class="cellphoneNo" />
			</div>
			<div class="textForm" hidden="Lev">
				<p style="float: left">권한
				<input type="radio" name="admin" value="0" checked="checked"> 일반회원 
				<input type="radio" name="admin" value="1"> 관리자</p>
			</div>
			<div class="textForm">
				<input type="submit" class="btn" value="S I G N U P" onclick="return joinCheck()">
			</div>
	</form>
</body>
</html>
<script>
// 전화번호 입력시 자동 (-)하이픈 처리 스크립트
function autoHypenPhone(str){
    str = str.replace(/[^0-9]/g, '');
    var tmp = '';
    if( str.length < 4){
        return str;
    }else if(str.length < 7){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3);
        return tmp;
    }else if(str.length < 11){
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 3);
        tmp += '-';
        tmp += str.substr(6);
        return tmp;
    }else{              
        tmp += str.substr(0, 3);
        tmp += '-';
        tmp += str.substr(3, 4);
        tmp += '-';
        tmp += str.substr(7);
        return tmp;
    }
    return str;
}

var cellPhone = document.getElementById('cellPhone');
cellPhone.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}
</script>