<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! int listCnt_all = 9; %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>해도북스 - 중고책팔기</title>

  <!-- Bootstrap 4 -->

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
  </script>


  <!-- CSS -->
  <link href="../CSS/list_page.css" rel="stylesheet">

  
</head>

<body>

  <!-- 페이지 상단 navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">해도북스</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
        aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">메인으로
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">중고책팔기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">자유 게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">안녕</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">

    <div class="row" id="content">

      <div class="col-lg-3">
        <!-- 로고 및 카테고리 -->
        <img src="../image/logo.png" alt="logo" id="logo">
        <h1 class="my-4 vw">메인 카테고리</h1>
        <div class="list-group">
          <a href="#" class="list-group-item subcate">세부 카테고리</a>
          <a href="#" class="list-group-item subcate">세부 카테고리 2</a>
          <a href="#" class="list-group-item subcate">세부 카테고리 3</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
        
        <nav class="navbar navbar-expand-sm bg-white navbar-light" id="search">
          <!-- Links -->
          <ul class="navbar-nav">
            <!-- selectbox -->
            <li class="nav-item cate">
              <select class="form-control selectbox">
                <option selected>카테고리</option>
                <option value="">카테1</option>
                <option value="">카테2</option>
                <option value="">카테3</option>
                <option value="">카테4</option>
              </select>
            </li>
            <form class="form-inline" action="#">  
              <input class="form-control search" type="text" placeholder="검색어">  
              <button class="btn btn-success" type="submit">찾기</button>  
            </form> 
          </ul>
        </nav>
        <div class="row">
<% for(int i = 0; i <= listCnt_all; i++){ %>
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100 bookbox">
            <!--  -->
              <a href="book_Read.jsp" class="book_img"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">
                <h4 class="card-title">
                  <a href="book_Read.jsp">중고책 제목</a>
                </h4>
                <h5>9,900원</h5>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet
                  numquam aspernatur!</p>
              </div>
              <div class="card-footer">
                <small class="text-muted"></small>
              </div>
            </div>
          </div>
<% } %>
          

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">

      <p class="m-0 text-center text-white">
        <img src="../image/logo-white.png" alt="logo" id="footer_logo">
        Copyright &copy; 2020. (주)해도북스 컴퍼니. All right reserved.</p>
    </div>
    <!-- /.container -->
  </footer>
<!-- 
<a href="https://imgur.com/1TFsO95"><img src="https://i.imgur.com/1TFsO95.png" title="source: imgur.com" /></a>
 -->


</body>

</html>