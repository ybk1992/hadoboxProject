<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <title>해도북스 중고책 거래 사이트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
  <p>Resize this responsive page to see the effect!</p> 
</div>
<jsp:include page="../header.jsp"></jsp:include>





<br><br><br><br>
  <h2>LOGIN</h2>     
<form name="frm" action="loginOk.do" method="post" onsubmit="return chkSubmit()">
아이디:<br>
<input type="text" name="mem_userid"/><br>
비밀번호:<br>
<input type="password" name="mem_password"/><br>

<input type="submit" value="등록"/>
</form>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
