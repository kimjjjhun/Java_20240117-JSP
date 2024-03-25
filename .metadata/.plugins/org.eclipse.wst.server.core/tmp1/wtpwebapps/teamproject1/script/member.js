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
	//주소 입력 확인
	if (document.frm.address.value.length == 0) {
		alert("주소를 입력하세요.");
		document.frm.address.focus();
		return false;
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
function searchpwCheck(){
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
	function emailAuthentication(){
		if(!emailValCheck()){
			return false;
		}
		
		var url = "confirmEmail?email=" + document.frm.email.value;
		open(url, "confirm",
		"toolbar=no, location=no,menubar=no,scrollbars=no,resizalbe=no,width=300,height=200");
	}
	
	const form = document.frm;
	
	function emailValCheck(){
		var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = form.email.value;
		if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")){
			return false;
		}
		return true;
	}
	
	function check(pattern, taget, message){
		if(pattern.test(taget)){
			return true;
		}
		alert(message);
		taget.focus();
		return false;
	}
}	