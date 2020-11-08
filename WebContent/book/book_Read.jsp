<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String LoginID = (String)session.getAttribute("mem_id");
%>

<c:choose>
	<c:when test="${empty book_List || fn:length(book_List) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>판매 글 페이지</title>
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
  <link href="CSS/read_page.css" rel="stylesheet">

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
            <a class="nav-link" href="#"><%=LoginID%>님 환영합니다.</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>


	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>이름</th>
			<th>가격</th>
			<th>작성일</th>
			<th>내용</th>
			<th>조회수</th>
			<th>카테고리 코드</th>
			<th>카테고리 명</th>
			<th>세부 카테고리</th>
			<th>이미지경로</th>
			<th>판매여부</th>
		</tr>
		<tr>
			<td>${book_List[0].book_num }</td>
			<td>${book_List[0].book_title }</td>
			<td>${book_List[0].book_sellid }</td>
			<td>${book_List[0].book_name }</td>
			<td>${book_List[0].book_price }</td>
			<td>${book_List[0].book_regdate }</td>				
			<td>${book_List[0].book_content }</td>				
			<td>${book_List[0].book_viewcnt }</td>				
			<td>${book_List[0].book_cate }</td>				
			<td>${book_List[0].book_cate_name }</td>				
			<td>${book_List[0].book_cate_pre }</td>				
			<td>${book_List[0].book_image }</td>	
			
			<c:set var="status" value="" />
			
			<c:choose>
			    <c:when test="${book_List[0].book_status eq '0'}">
			        <c:set var="status" value="판매완료"/>
			    </c:when>
			    <c:when test="${book_List[0].book_status eq '1'}">
			        <c:set var="status" value="판매중"/>
			    </c:when>
			</c:choose>

			<td>${status}</td>
		</tr>

	</table>
	
	
<div class="container" id="content">
    <div class="row">
        <div class="col-md-5">
        	<img src="${book_List[0].book_image }" alt="">
        </div>
        
        <div class="col-md-6 info">
        	<div class="row title">
        		<p>${book_List[0].book_title }</p>
        	</div>
        	<div class="row cate">
        		<p>${book_List[0].book_cate_name } > ${book_List[0].book_cate_pre }</p>
        	</div>
        	<div class="row price">
        		<p>${book_List[0].book_price } 원</p>
        	</div>
        	<div class="row content">
        		<p>${book_List[0].book_content }</p>
        	</div>
        		
        </div>
    </div>
    <div class="row seller">
        <div class="col-md-11">
        	<p>판매자		${book_List[0].book_sellid }</p>
        </div>
    </div>
    <div class="row doComment">
        <div class="col-md-9"><button onclick="location.href='update.do?book_num=${book_List[0].book_num}'">수정하기</button></div>
        <div class="col-md-2"></div>
    </div>
    <div class="row viewComment">
        <div class="col-md-2"></div>
        <div class="col-md-9"></div>
    </div>
</div>

  
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">

      <p class="m-0 text-center text-white">
        <img src="image/logo-white.png" alt="logo" id="footer_logo">
        Copyright &copy; 2020. (주)해도북스 컴퍼니. All right reserved.</p>
    </div>
    <!-- /.container -->
  </footer>
  
</body>
</html>

	</c:otherwise>
</c:choose>