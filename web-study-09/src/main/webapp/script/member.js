
function loginCheck() {
	
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
function idCheck() {
	if (document.frm.userid.value == "") {
		alert("아이디를 입력하세요.");
		document.frm.userid.focus();
		return false;
	}

	//idCheck.do?userid=user찾아감
	let url = "idCheck.do?userid=" + document.frm.userid.value;
	window.open(url, "_blank_1", "width=450, height=200");
}

//사용버튼을 누를시 입력했던 id값을 그대로 회원가입페이지에 적용
function idok() {
	opener.frm.userid.value = document.frm.userid.value;
	opener.frm.reid.value = document.frm.userid.value;
	self.close();
}
function joinCheck() {
	if (document.frm.name.value.length == 0) {
		alert("이름을 입력하세요.");
		document.frm.name.focus();
		return false;
	}
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력하세요.");
		document.frm.userid.focus();
		return false;
	}
	if (document.frm.userid.legth <= 4) {
		alert("아이디는 4글자 이상 가능합니다.");
		document.frm.userid.focus();
		return false;
	}
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

	if (document.frm.reid.value == "") {
		alert("중복체크를 실행하세요.");
		frm.userid.focus();
		return false;
	}

	if (document.frm.email.value == "") {
		alert("이메일을 입력하세요.");
		frm.userid.focus();
		return false;
	}
}

