<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- join.css를 사용하기위한 링크 -->
<link rel="stylesheet" href="css/join.css">

<!-- css에 아이콘을 넣기위해서 링크추가 -->
<script src="https://kit.fontawesome.com/d41dbe5e59.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jQuery를 불러옵니다. -->

<!-- member.js 유효성검사를 하기위한 스크립트 -->
<script src="script/member.js"></script>

<title>join</title>
</head>
<body>

	<!-- 회원가입 폼 -->

	<h1>회원가입</h1>
	<div class="joinTerms">
		<p>서비스약관에 동의해주세요</p>

		<form action="" class="checkForm">
			<input type="checkbox" id="allTerms"> <label for="allTerms">모두
				동의합니다.</label>

			<div class="termsBox">
				<div class="">
					<input type="checkbox" id="check1" class="termsCheck"> <label
						for="check1">[필수] 만 14세 이상입니다</label>
				</div>
				<div>
					<input type="checkbox" id="check2" class="termsCheck"> <label
						for="check2">[필수] 이용약관 동의</label>
				</div>
				<div>
					<input type="checkbox" id="check3" class="termsCheck"> <label
						for="check3">[필수] 전자금융거래 이용약관 동의</label>
				</div>
				<div>
					<input type="checkbox" id="check4" class="termsCheck"> <label
						for="check4">[필수] 개인정보 수집 및 이용 동의</label>
				</div>
				<div>
					<input type="checkbox" id="check5" class="termsCheck"> <label
						for="check5">[필수] 개인정보 제공 동의</label>
				</div>
			</div>
			<input
				style="width: 100%; height: 100%; border-radius: 50px; margin-top: 20px;"
				type="button" value="뒤로 가기" onclick="history.back()">
		</form>
	</div>
	<main>
		<div class="joinWrap" id="joinWrap" style="display: none;">

			<form action="OttServlet" method="post" id="joinForm" name="frm">
				<input type="hidden" name="command" value="member_insert">

				<p style="text-align: center;">회원정보를 입력해주세요</p>

				<div class="joinBox">
					<label for="email"><i class="fa-regular fa-envelope"></i></label> <input
						type="text" name="email" id="email" placeholder="이메일" required>
				</div>

				<div class="joinBox">
					<label for="userid"><i class="fa-solid fa-id-card"></i></label> <input
						type="text" name="userid" id="userid" placeholder="아이디" required>
				</div>

				<div class="signbox" style="text-align: center;">
					<input style="margin-bottom: 10px" type="button" value="ID 중복 체크"
						onclick="idCheck()"> <input type="hidden" name="reid">
				</div>

				<div class="joinBox">
					<label for="password"><i class="fa-solid fa-lock"></i></label> <input
						type="password" name="pwd" id="password" placeholder='비밀번호'
						required>
				</div>
				<div class="joinBox">
					<label for="passwordre"><i class="fa-solid fa-lock"></i></label> <input
						type="password" name="pwd_check" id="password"
						placeholder='비밀번호재입력' required>
				</div>
				<div class="joinBox">
					<label for="name"><i class="fa-solid fa-user"></i></label> <input
						type="text" name="name" id="name" placeholder="이름" required>
				</div>
				<div class="joinBox">
					<label for="phone"><i
						class="fa-solid fa-mobile-screen-button"></i></label> <input type="text"
						name="phone" id="phone" placeholder="휴대폰 번호" required>
				</div>
				<div class="joinBox">
					<label for="address"><i class="fa-solid fa-map"></i></label> 
					<input type="text" name="address" id="address" placeholder="주 소" required> 
				</div>
				<div class="signbox"
					style="text-align: center; margin-bottom: 20px; border-radius: 50px;">
					<input type="submit" class="fa-solid fa-mobile-screen-button"
						value="S I G N U P" onclick="return joinCheck()">
				</div>
				<div class="signbox"
					style="text-align: center; border-radius: 50px;">
					<input type="submit" class="fa-solid fa-mobile-screen-button"
						value="뒤로 가기" onclick="history.back()">
				</div>
			</form>
		</div>
	</main>
</body>
</html>

<!--  전화번호 입력시 자동 (-)하이픈 처리 스크립트 -->
<script>
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

var cellPhone = document.getElementById('phone');
cellPhone.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}
</script>

<!-- 약관동의를 모두선택할경우 회원가입폼이 출력되는 스크립트 -->
<script>
$(function(){
    $('#allTerms').click(function(){
        var checked = $(this).is(':checked');

        if(checked){
            $('.termsCheck').prop('checked', true);
            $('#joinWrap').show(); // 회원가입 양식을 보여줍니다.
            $('.joinTerms').hide(); // 약관 동의란을 숨깁니다.
        }else {
            $('.termsCheck').prop('checked', false);
            $('#joinWrap').hide(); // 회원가입 양식을 숨깁니다.
            $('.joinTerms').show(); // 약관 동의란을 보여줍니다.
        }
    });

    $('.termsCheck').click(function(){
        var terms = $('.termsCheck');
        var flag = true;

        for(var input of terms){
            if (!input.checked) {
                flag = false;
                break; // 하나라도 체크되어 있지 않으면 루프를 종료합니다.
            }
        }

        if(flag){
            $('#allTerms').prop('checked', true);
            $('#joinWrap').show(); // 회원가입 양식을 보여줍니다.
            $('.joinTerms').hide(); // 약관 동의란을 숨깁니다.
        }else {
            $('#allTerms').prop('checked', false);
            $('#joinWrap').hide(); // 회원가입 양식을 숨깁니다.
            $('.joinTerms').show(); // 약관 동의란을 보여줍니다.
        }
    });
});
</script>
