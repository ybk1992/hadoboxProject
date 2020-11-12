<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<title>해도북스 중고책 거래 사이트</title>
</head>

<script>
// form validation 

function chkSubmit(){
	frm = document.forms['frm'];
	
	var mem_userid = frm["mem_userid"].value.trim();
	var mem_password = frm["mem_password"].value.trim();
	
	if(mem_userid == ""){
		alert("아이디를 입력하세요.");
		frm["mem_userid"].focus();
		return false;
	}
	
	if(mem_password == ""){
		alert("비밀번호를 입력하세요.");
		frm["mem_password"].focus();
		return false;
	}
	
	return true;	
		
}

</script>
<body>
<div class="text-center" style="margin-bottom:0">
  <h1>해도북스</h1>
  <p>중고책을 찾아보세요</p> 
</div>
<jsp:include page="../header.jsp"></jsp:include>


<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>로그인</h3>
			</div>
			<div>
				<form name="frm" action="loginOk.do" method="post"  onsubmit="return chkSubmit()">

				<p>
				
					<label>아이디</label>
					<input class="w3-input" type="text" id="mem_userid" name="mem_userid" required>
				</p>
				<p>
					<label>비밀번호</label>
					<input class="w3-input" type="password" id="mem_password" name="mem_password" required>
				</p>
				<p class="w3-center">
					<button type="button" onclick="location.href='findPassword.do';" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">아이디 비밀번호 찾기</button>
					<input type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round" value="로그인 하기"/>
				
				</p>
				
				</form>
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
