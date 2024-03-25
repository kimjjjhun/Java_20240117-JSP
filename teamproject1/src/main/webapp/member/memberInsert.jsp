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

<!-- jQuery를 불러옵니다. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 다음 주소찾기 api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

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
					<!-- <input type="text" name="address" id="address" placeholder="주 소" required> -->

					<input type="text" id="sample6_postcode" placeholder="우편번호">
				</div>

				<div class="signbox" style="text-align: center;">
					<input style="margin-bottom: 10px" type="button" value="우편번호 찾기"
						onclick="sample6_execDaumPostcode()">
				</div>

				<div class="joinBox">
					<label for="address"><i class="fa-solid fa-map"></i></label> <input
						type="text" id="sample6_address" name="address" placeholder="주소"><br>
				</div>

				<div class="joinBox">
					<label for="address"><i class="fa-solid fa-map"></i></label> <input
						type="text" id="sample6_detailAddress" name="detailAddress"
						placeholder="상세주소">
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


<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					document.getElementById("sample6_extraAddress").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('sample6_postcode').value = data.zonecode;
				document.getElementById("sample6_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("sample6_detailAddress").focus();
			}
		}).open();
	}
</script>

<script>	
	// 주소를 찾고 선택시 자동입력 //

    // 우편번호 찾기를 실행하고 선택한 주소 정보를 입력하는 함수
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.

                // 우편번호와 주소 정보를 해당 필드에 자동으로 입력
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = data.address;

                // 상세주소 입력 필드에 포커스 설정
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    </script>


