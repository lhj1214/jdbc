<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
<%	response.setCharacterEncoding("utf-8"); %>
	function regi(){
		id = document.getElementById("id").value;
		var pwd = document.getElementById("pwd").value;
		var pwdch = document.getElementById("pwdch").value;
		if(id == ""){
			alert("아이디는 필수항목입니다");
			document.getElementById("id").focus()
		}else if(pwd == ""){
			alert("비밀번호는 필수항목입니다");
			document.getElementById("pwd").focus()
		}else if(pwdch == ""){
			alert("비밀번호 확인은 필수항목입니다");
			document.getElementById("pwdch").focus()
		}else{
			var fm = document.getElementById("frm");
			fm.action = "chkRegister.jsp"
			fm.method = "post";
			fm.submit();
		}
	}
	function check(){
		var pwd = document.getElementById("pwd").value;
		var pwdch = document.getElementById("pwdch").value;
		if(pwd==pwdch){
			document.getElementById("check").innerHTML = "일치";
		}else{
			document.getElementById("check").innerHTML = "불일치";
			document.getElementById("pwdch").value = "";
			document.getElementById("pwdch").focus();
		}
	}
</script>
</head>
<body>
<form id="frm">
	<input type="text" placeholder="아이디" name="id" id="id">(*필수 항목)<br>
	<input type="text" placeholder="비밀번호" id="pwd" name="pwd">(*필수 항목)<br>
	<input type="text" placeholder="비밀번호 확인" id="pwdch" onchange="check()"><label id="check"></label><br>
	<input type="text" placeholder="이름" name="name"><br>
	<input type="text" placeholder="주소" name="addr"><br>
	<input type="text" placeholder="전화번호" name="tel"><br>
	<button type="button" onclick="regi()">회원가입</button>
</form>
</body>
</html>