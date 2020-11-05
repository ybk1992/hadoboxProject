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
<br><br>
  <h2 style="text-align:center;" >마이페이지</h2>
  <br><br>
       <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
            <div class="form-row">
              <div class="col-12">
      			 <label style="font-size:25px;">아이디</label>                
              </div>            
              
              <div class="col-9">
                <input type="email" class="form-control form-control-lg" placeholder="아이디를 입력하세요">
              </div>
              
              <div class="col-2">
                <button type="submit" class="btn btn-block btn-lg btn-primary">확인</button>
              </div>              
            </div>
            
            <br>
           <div class="form-row">
              <div class="col-12">
      			 <label style="font-size:25px;">비밀번호</label>                
              </div>            
              
              <div class="col-9">
                <input type="email" class="form-control form-control-lg" placeholder="6자리 이상의 비밀번호를 입력하세요">
              </div>            
            </div>
            <br>
           <div class="form-row">
              <div class="col-12">
      			 <label style="font-size:25px;">비밀번호 재확인</label>                
              </div>            
              
              <div class="col-9">
                <input type="email" class="form-control form-control-lg">
              </div>            
            </div>
            
                        
            <br>
           <div class="form-row">
              <div class="col-12">
      			 <label style="font-size:25px;">이름</label>                
              </div>            
              
              <div class="col-9">
                <input type="email" class="form-control form-control-lg" placeholder="실명을 입력하세요">
              </div>            
            </div>
            
              
            <br>
           <div class="form-row">
              <div class="col-12">
      			 <label style="font-size:25px;">핸드폰 번호</label>                
              </div>            
              
              <div class="col-9">
                <input type="email" class="form-control form-control-lg" placeholder="-를 제외하고 입력하세요">
              </div>            
            </div>  
              
            <br>
           <div class="form-row">
              <div class="col-12">
      			 <label style="font-size:25px;">이메일</label>                
              </div>            
              
              <div class="col-9">
                <input type="email" class="form-control form-control-lg" placeholder="아이디.비밀번호 찾기에 필요합니다.">
              </div>            
            </div>  
            
            <br>
            <div class="form-row">
              <div class="col-12">
      			 <label style="font-size:25px;">우편번호</label>                
              </div>            
              
              <div class="col-9">
                <input type="email" class="form-control form-control-lg">
              </div>
              
              <div class="col-2">
                <button type="submit" class="btn btn-block btn-lg btn-primary">찾기</button>
              </div>              
            </div>
            
            <br>
           <div class="form-row">
              <div class="col-12">
      			 <label style="font-size:25px;">주소</label>                
              </div>            
              
              <div class="col-9">
                <input type="email" class="form-control form-control-lg">
              </div>            
            </div>  
            
            <br>
           <div class="form-row">
              <div class="col-12">
      			 <label style="font-size:25px;">상세 주소</label>                
              </div>            
              
              <div class="col-9">
                <input type="email" class="form-control form-control-lg" placeholder="상세 주소를 입력하세요 (ex 101동 101호)">
              </div>            
            </div>  
            
                        
            <br>
            <div class="form-row">
              <div class="col-12">
      			 <label style="font-size:25px;">내 이미지</label>                
              </div>            
              
              <div class="col-9">
                <input type="email" class="form-control form-control-lg">
              </div>
              
              <div class="col-2">
                <button type="submit" class="btn btn-block btn-lg btn-primary">찾기</button>
              </div>              
            </div>
             <br>
                <button type="submit" class="btn btn-primary btn-lg">가입하기</button>
            
            
            <br><br>
            
            
        </div>
</body>
</html>
