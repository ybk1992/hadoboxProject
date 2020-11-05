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
<%--공통--------------------------------------------------------------------------%>
<div class="text-center" style="margin-bottom:0">
  <h1>해도북스</h1>
  <p>Resize this responsive page to see the effect!</p> 
</div>


<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <ul class="navbar-nav mr-auto" style="font-size:20px;">
            <li class="nav-item active">
                <a class="nav-link" href="main.jsp" >메인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">중고책장터</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">자유게시판</a>
            </li>
        </ul>
    </div>
    
    <div class="mx-auto order-0">
        <a class="navbar-brand mx-auto" href="#"><img src="bbb.jpg" alt="Logo" style="width:40px;"> HD BOOK [중고 책 거래 사이트]  </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
    
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="join.jsp">회원가입</a>
            </li>
        </ul>
    </div>
</nav>
<%--공통--------------------------------------------------------------------------%>
<br><br><br><br>
  <h2>LOGIN</h2>     
<form name="frm" action="loginOk.do" method="post" onsubmit="return chkSubmit()">
아이디:<br>
<input type="text" name="mem_userid"/><br>
비밀번호:<br>
<input type="password" name="mem_password"/><br>

<input type="submit" value="등록"/>
</form>
  
</body>
</html>
