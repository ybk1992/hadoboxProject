<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function chkSubmit(){
	
	frm = document.forms['checkForm'];
	
	var inputid = frm["inputid"].value.trim();
    var expIdText = /^[a-zA-z0-9]{4,12}$/;
    
    if(expIdText.test(inputid) == false){
        alert('아이디 형식을 확인하세요. 4~12 영어 소문자 대문자 숫자로 이뤄질수있습니다');
		frm["inputid"].focus();
        return false;
    }
    
	return true;			

}

function useId(){
    String i = "";
	i = (String)application.getAttribute("id");

	if(i == "") {
		alter("중복검사를하세요");

	}
	else{
		alter(i);

		
		document.getElementById("useBtn").style.visibility='hidden';
	}

}

</script>
<body>
<div id="wrap">
	<br>
	<b>아이디 중복 확인</b>
	<hr>
	<br>
	<div id="chk">
		<form name="checkForm" action="idOk.do" method="post" onsubmit="return chkSubmit()">
			<input type="text" name="inputid" id="userId">
			<input type="submit" value="중복확인">
		</form>
		<br>
		<input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
		<input id="useBtn" type="button" value="사용하기" onclick="useId()"/>
	
	</div>

</div>
</body>
</html>