<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
  <link href="CSS/list_page.css" rel="stylesheet">

  
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
        <img src="image/logo.png" alt="logo" id="logo">
        <h1 class="my-4 vw">메인 카테고리</h1>
        <div class="list-group ">
          <a href="#" class="list-group-item subcate" id="0">세부 카테고리</a>
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
                <option selected value=0>카테고리</option>
                <option value="1">교육</option>
                <option value="2">시험</option>
                <option value="3">만화</option>
                <option value="4">소설</option>
                <option value="5">예술</option>
                <option value="6">여행</option>
                <option value="7">유아</option>
                <option value="8">역사</option>
                <option value="9">IT</option>
                
              </select>
            </li>
            <form class="form-inline" action="#">  
              <input class="form-control search" type="text" placeholder="검색어">  
              <button class="btn btn-success" type="submit">찾기</button>  
            </form> 
          </ul>
        </nav>
        <div class="row" id="listDiv">
        
		<c:choose>	
			<c:when test="${empty book_List || fn:length(book_List) == 0 }"> 
			</c:when>
	
			<c:otherwise> 
				<c:forEach var="dto" items="${book_List }"> 
				
				  <div class="col-lg-4 col-md-6 mb-4">
		            <div class="card h-100 bookbox">
		              <a href="book_Read.do?book_num=${dto.book_num }" class="book_img">
		              	<img class="card-img-top" src="${dto.book_image }" alt="" height="300px">
		              </a>
		              <div class="card-body">
		                <h4 class="card-title">
		                  <a href="book_Read.do?book_num=${dto.book_num }">${dto.book_title }</a>
		                </h4>
		                <h5>${dto.book_price }</h5>
		                <p class="card-text">${dto.book_name }</p>
		              </div>
		              
		              <div class="card-footer">
		              
		              	<c:set var="status" value="" />
						
						<c:choose>
						    <c:when test="${dto.book_status eq '0'}">
						        <c:set var="status" value="판매완료"/>
						    </c:when>
						    <c:when test="${dto.book_status eq '1'}">
						        <c:set var="status" value="판매중"/>
						    </c:when>
						</c:choose>
						
		                <small class="text-muted">${status}</small>
		              </div>
		            </div>
		          </div>
		          
				</c:forEach>
			</c:otherwise>
		</c:choose>
          

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
        <img src="image/logo-white.png" alt="logo" id="footer_logo">
        Copyright &copy; 2020. (주)해도북스 컴퍼니. All right reserved.</p>
    </div>
    <!-- /.container -->
  </footer>
<!-- 
<a href="https://imgur.com/1TFsO95"><img src="https://i.imgur.com/1TFsO95.png" title="source: imgur.com" /></a>
 -->
<script>

  //Javascript
  var count = 0;
  //스크롤 바닥 감지
  $(window).scroll(function () {
    let $window = $(this);
    let scrollTop = $window.scrollTop();
    let windowHeight = $window.height();
    let documentHeight = $(document).height();
    console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight);
    
    if (scrollTop + windowHeight + 10 > documentHeight) {
      //실행할 로직 (콘텐츠 추가)
      count += 3;
      var addContent =
        '<div class="col-lg-4 col-md-6 mb-4"><div class="card h-100 bookbox"><a href="#" class="book_img"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a><div class="card-body"><h4 class="card-title"><a href="#">중고책 제목 ' + count + '</a></h4><h5>9,900원</h5><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ametnumquam aspernatur!</p></div><div class="card-footer"><small class="text-muted"></small></div></div></div><div class="col-lg-4 col-md-6 mb-4"><div class="card h-100 bookbox"><a href="#" class="book_img"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a><div class="card-body"><h4 class="card-title"><a href="#">중고책 제목 ' + (count + 1) + '</a></h4><h5>9,900원</h5><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ametnumquam aspernatur!</p></div><div class="card-footer"><small class="text-muted"></small></div></div></div><div class="col-lg-4 col-md-6 mb-4"><div class="card h-100 bookbox"><a href="#" class="book_img"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a><div class="card-body"><h4 class="card-title"><a href="#">중고책 제목 ' + (count + 2) + '</a></h4><h5>9,900원</h5><p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ametnumquam aspernatur!</p></div><div class="card-footer"><small class="text-muted"></small></div></div></div>';
      
      //article에 추가되는 콘텐츠를 append
      $('div#listDiv').append(addContent);
    }
  });

  </script>
</body>

</html>
