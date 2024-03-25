function loginCheck() {
	//로그인유효성검사	
	if (document.frm.userid.value == "") {
		alert("아이디를 입력하세요.");
		frm.userid.focus();
		return false;
	}

	if (document.frm.pwd.value == "") {
		alert("암호를 입력하세요.");
		frm.pwd.focus();
		return false;
	}

	return true;
}

//중복체크 검사
function idCheck() {
	if (document.frm.userid.value == "") {
		alert("아이디를 입력하세요.");
		document.frm.userid.focus();
		return false;
	}
	//새로운 window창이 뜨면서 중복체크.jsp실행	
	let url = "OttServlet?command=idCheck&userid=" + document.frm.userid.value;
	window.open(url, "_blank_1", "width=450, height=200");
}

//사용버튼을 누를시 입력했던 id값을 그대로 회원가입페이지에 적용
function idok() {
	opener.frm.userid.value = document.frm.userid.value;
	opener.frm.reid.value = document.frm.userid.value;
	self.close();
}

//회원가입검사
function joinCheck() {
	// 이메일 입력 확인
	if (document.frm.email.value.length == 0) {
		alert("이메일을 입력하세요.");
		document.frm.email.focus();
		return false;
	}
	// 이메일 형식 확인 @ 포함인가?
	if (document.frm.email.value.indexOf('@') == -1) {
		alert("이메일 형식이 아닙니다.");
		document.frm.email.focus();
		return false;
	}
	//아이디 입력 확인
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력하세요.");
		document.frm.useri.focus();
		return false;
	}
	//아이디길이확인 4글자 이상인가?
	if (document.frm.userid.value.length <= 4) {
		alert("아이디는 4글자 이상 가능합니다.");
		document.frm.userid.focus();
		return false;
	}
	//비밀번호입력확인
	if (document.frm.pwd.value == "") {
		alert("비밀번호를 입력하세요.");
		document.frm.pwd.focus();
		return false;
	}
	//비밀번호 재확인
	if (document.frm.pwd.value != document.frm.pwd_check.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.frm.pwd.focus();
		return false;
	}
	//이름입력확인 공백이 아닌가?
	if (document.frm.name.value.length == 0) {
		alert("이름을 입력하세요.");
		document.frm.name.focus();
		return false;
	}
	//전화번호 입력 확인
	if (document.frm.phone.value.length == 0) {
		alert("전화번호를 입력하세요.");
		document.frm.phone.focus();
		return false;
	}
	// 주소 입력 확인
	var addressInput = document.getElementById("sample6_address").value.trim(); // 주소 입력 필드의 값을 가져옴

	if (addressInput.length === 0) { // 주소 입력 필드가 비어있는지 확인
		alert("주소를 입력하세요."); // 경고 메시지 표시
		document.getElementById("sample6_address").focus(); // 주소 입력 필드에 포커스 맞춤
		return false; // 폼 제출을 막기 위해 false 반환
	}
	//중복체크버튼을 눌러서 확인 했는지 확인
	if (document.frm.reid.value == "") {
		alert("중복체크를 실행하세요.");
		frm.userid.focus();
		return false;
	}

}

function searchCheck() {
	//이름입력확인 공백이 아닌가?
	if (document.frm.name.value.length == 0) {
		alert("이름을 입력하세요.");
		document.frm.name.focus();
		return false;
	}
	// 이메일 입력 확인
	if (document.frm.email.value.length == 0) {
		alert("이메일을 입력하세요.");
		document.frm.email.focus();
		return false;
	}
}
function searchpwCheck() {
	//아이디 입력 확인
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력하세요.");
		document.frm.userid.focus();
		return false;
	}
	// 이메일 입력 확인
	if (document.frm.email.value.length == 0) {
		alert("이메일을 입력하세요.");
		document.frm.email.focus();
		return false;
	}
	//이메일
	function emailAuthentication() {
		if (!emailValCheck()) {
			return false;
		}

		var url = "confirmEmail?email=" + document.frm.email.value;
		open(url, "confirm",
			"toolbar=no, location=no,menubar=no,scrollbars=no,resizalbe=no,width=300,height=200");
	}

	const form = document.frm;

	function emailValCheck() {
		var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = form.email.value;
		if (!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
			return false;
		}
		return true;
	}

	function check(pattern, taget, message) {
		if (pattern.test(taget)) {
			return true;
		}
		alert(message);
		taget.focus();
		return false;
	}

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

	

}	