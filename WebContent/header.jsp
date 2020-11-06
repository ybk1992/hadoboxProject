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
<body>

<%--공통--------------------------------------------------------------------------%>

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
        <a class="navbar-brand mx-auto" href="#"><img src="hdlogo.png" alt="Logo" style="width:40px;"> HD BOOK [중고 책 거래 사이트]  </a>
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


</body>

</html>
