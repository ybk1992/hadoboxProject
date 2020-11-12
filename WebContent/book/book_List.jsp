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

  <title>해도북스 - 중고책팔기 </title>

  <!-- Bootstrap 4 -->

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
  </script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>


  <!-- CSS -->
  <link href="CSS/list_page.css" rel="stylesheet">

  
</head>

<body>

  <!-- 페이지 상단 navbar -->
 <jsp:include page="../header.jsp"></jsp:include>

  <c:set var="list" value='<%=request.getParameter("list") %>'/>	<!-- main.do에서 book_list.do?list=all로 값넘김 -->
  <c:set var="catepre" value='<%=request.getParameter("cp") %>'/>	<!-- book_List.do에서 book_list.do?cp=선택값으로 값넘김 -->
  <c:set var="search" value='<%=request.getParameter("search") %>'/>	<!-- book_List.do에서 book_list.do?search=입력값으로 값넘김 -->
  <!-- Page Content -->
  <div class="container">

    <div class="row" id="content">

      <div class="col-lg-3">
        <!-- 로고 및 카테고리 -->
        <a href="book_List.do?list=all"><img src="image/logo.png" alt="logo" id="logo"></a>
		
        <h1 class="my-4 vw" id="maincate"><%=request.getParameter("mc") %></h1>
        <h1 class="my-4 vw" id="sub"><%=request.getParameter("cp") %></h1>
		<!-- selectbox -->
        <select class="form-control selectbox" id="cate">
        	<option selected value="0">카테고리</option>
				<c:set var="i" value="0" />
	    	  	<c:forEach var="dto" items="${cate }" varStatus="status"> 
		       		<c:choose>
		      			<c:when test="${cate[status.index].book_cate_name ne cate[status.count].book_cate_name }"> 
					   		<c:set var="i" value="${i+1 }"/>	
					   		<option value="${i }">${cate[status.index].book_cate_name }</option> 
						</c:when >
						<c:otherwise>
            			<!-- cate[0] != cate[1] -->
       				 	<!-- i++ -->
        				<!-- cate[1] -->
						</c:otherwise>
		      		</c:choose>
	        </c:forEach>
        </select>
        <select class="form-control selectbox" id="pre" title="세부 카테고리"> <!-- 세부 카테고리 select box -->
		</select>
        				
      </div><!-- /.col-lg-3 -->

      <div class="col-lg-9">
        
        <!-- 검색창 & 중고책 등록버튼 -->
        <nav class="navbar navbar-expand-sm bg-white navbar-light" id="search">
          <ul class="navbar-nav">
	          <input class="form-control search" id="searchInput" type="text" placeholder="검색어" />  
	          <button class="btn btn-dark" id="searchBtn" onclick="searchClick()">찾기</button>   <!-- 쿼리스트링으로 input value값 서버단으로 전달 -->
          </ul>
          <c:if test="${memLogin==true}">
          	<button class="btn btn-light" onclick="location.href='write.do'">중고책등록</button>
          </c:if>
        </nav>
        
        <div class="row" id="listDiv">
       
		<c:choose>	
			<c:when test="${empty book_List || fn:length(book_List) == 0 }"> 
			</c:when>
			
			<c:when test="${list eq 'all'}"> 	<!-- 넘어온 쿼리스트링값이 all일때 전체메뉴 실행 -->
				<c:forEach var="dto" items="${book_List }" end="5"> 
				
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
			</c:when>
			<c:when test="${not empty book_cate_pre }">
				<c:forEach var="dto" items="${book_cate_pre }" end="5"> 
				
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
			</c:when>
			<c:when test="${not empty search }">
				<c:forEach var="dto" items="${searchWord }" end="5"> 
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
			</c:when>
			
		</c:choose>
          <!-- choose 종료 -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.col-lg-9 -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
	
  <!-- Footer -->
  <jsp:include page="../footer.jsp"></jsp:include>
<!-- 
<a href="https://imgur.com/1TFsO95"><img src="https://i.imgur.com/1TFsO95.png" title="source: imgur.com" /></a>
 -->



<script>
function searchClick(){
	const url = 'book_List.do?search='+$('input#searchInput').val();
	location.href = url;
}

$(document).ready(function(){
	if( $("h1#maincate").text() == 'null' && $("h1#sub").text() == 'null'){
		$("h1#maincate").empty();
		$("h1#sub").empty();
	}
$(document).on("change","select#pre", function(){
	  
	$("h1#maincate").text($("select#cate option:selected").text());
	$("h1#sub").text($("select#pre option:selected").text());

	const url = 'book_List.do?mc='+$("select#cate option:selected").text()+'&cp='+$("select#pre option:selected").text();
	location.href = url;

  });  		
});
	

$(function(){
	$('select#cate').change(function () {
		switch (this.value) {
		    case '0':
		        $("h1#maincate").text($("select#cate option:selected").text());
		        $("h1#sub").empty();
		        $("select#pre").empty();
		        $("select#pre").append("<option class='list-group-item subcate'>전체</option>");
		        break;
		    case '1':
		        $("h1#maincate").text($("select#cate option:selected").text());
		        $("h1#sub").empty();
		        $("select#pre").empty();
		        $("select#pre").append("<option class='list-group-item subcate'>세부카테고리</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>대학</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>초중고</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>외국어</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>기타</option>");
		        break;
		    case '2':
		        $("h1#maincate").text($("select#cate option:selected").text());
		        $("h1#sub").empty();
		        $("select#pre").empty();
		        $("select#pre").append("<option class='list-group-item subcate'>세부카테고리</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>공무원</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>외국어능력시험</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>기타</option>");
		        break;
		    case '3':
		        $("h1#maincate").text($("select#cate option:selected").text());
		        $("h1#sub").empty();
		        $("select#pre").empty();
		        $("select#pre").append("<option class='list-group-item subcate'>세부카테고리</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>소년만화</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>스포츠</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>미스테리</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>요리</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>웹툰</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>기타</option>");
		        break;
		    case '4':
		        $("h1#maincate").text($("select#cate option:selected").text());
		        $("h1#sub").empty();
		        $("select#pre").empty();
		        $("select#pre").append("<option class='list-group-item subcate'>세부카테고리</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>판타지</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>라이트 노벨</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>공상과학</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>호러</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>무협</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>액션</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>로맨스</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>시</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>기타</option>");
		        break;
		    case '5':
		        $("h1#maincate").text($("select#cate option:selected").text());
		        $("h1#sub").empty();
		        $("select#pre").empty();
		        $("select#pre").append("<option class='list-group-item subcate'>세부카테고리</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>미술</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>음악</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>영화</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>건축</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>디자인</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>기타</option>");
		        break;
		    case '6':
		        $("h1#maincate").text($("select#cate option:selected").text());
		        $("h1#sub").empty();
		        $("select#pre").empty();
		        $("select#pre").append("<option class='list-group-item subcate'>세부카테고리</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>국내여행</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>유럽여행</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>아시아여행</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>아프리카여행</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>아메리카여행</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>기타</option>");
		        break;
		    case '7':
		        $("h1#maincate").text($("select#cate option:selected").text());
		        $("h1#sub").empty();
		        $("select#pre").empty();
		        $("select#pre").append("<option class='list-group-item subcate'>동화책</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>유아학습</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>기타</option>");
		        break;
		    case '8':
		        $("h1#maincate").text($("select#cate option:selected").text());
		        $("h1#sub").empty();
		        $("select#pre").empty();
		        $("select#pre").append("<option class='list-group-item subcate'>세부카테고리</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>국내 역사</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>해외 역사</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>기타</option>");
		        break;
		    case '9':
		        $("h1#maincate").text($("select#cate option:selected").text());
		        $("h1#sub").empty();
		        $("select#pre").empty();
		        $("select#pre").append("<option class='list-group-item subcate'>세부카테고리</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>프로그래밍</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>그래픽</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>웹디자인</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>오피스</option>");
		        $("select#pre").append("<option class='list-group-item subcate'>기타</option>");
		        break;
		}
	});
});
</script>
<script>
  let arr = new Array();

  //스크롤 바닥 감지
  var i = 0;
  var scrollLock = true;
  //무한 스크롤을 위한 판매글 데이터 arr에 push
	<c:choose>	
 		<c:when test="${list eq 'all'}">
			<c:forEach items="${book_List }" var="dt"  begin="6" end="${fn:length(book_List)}">
			 	arr.push({ num: "${dt.book_num}"
					, image: "${dt.book_image}"
			    	, title: "${dt.book_title}"
			   		, price: "${dt.book_price}"
					, name: "${dt.book_name}"
					, status: "${dt.book_status}"});
			 	console.log('전체값 들어가유~');
			</c:forEach>
		</c:when>
 		<c:when test="${not empty catepre}">
			<c:forEach items="${book_cate_pre }" var="dtp"  begin="6" end="${fn:length(book_cate_pre)}">
			 	arr.push({ num: "${dtp.book_num}"
					, image: "${dtp.book_image}"
			    	, title: "${dtp.book_title}"
			   		, price: "${dtp.book_price}"
					, name: "${dtp.book_name}"
					, status: "${dtp.book_status}"});
			 	console.log('카테값 들어가유~'+arr[0].name);
			</c:forEach>
		</c:when>
 		<c:when test="${not empty search}">
			<c:forEach items="${searchBook }" var="dts"  begin="6" end="${fn:length(searchBook)}">
			 	arr.push({ num: "${dts.book_num}"
					, image: "${dts.book_image}"
			    	, title: "${dts.book_title}"
			   		, price: "${dts.book_price}"
					, name: "${dts.book_name}"
					, status: "${dts.book_status}"});
			 	console.log('검색값 들어가유~'+arr[0].name);
			</c:forEach>
		</c:when>
	</c:choose>
 
 
 
 $(window).scroll(function (e) {
	 let $window = $(this);
	 let scrollTop = $window.scrollTop();
     let windowHeight = $window.height();
     let documentHeight = $(document).height();
    
   	 if (i < arr.length && scrollTop + windowHeight + 30 > documentHeight) {  //무한스크롤
     	//실행할 로직 (판매글 추가)
   		let stat = '';
   	 	if(arr[i].status == '0'){
   	 		stat = '판매완료';
   	 	}else{
   	 		stat = '판매중';
   	 	}
   	 	<c:choose>	
   	 		<c:when test="${list eq 'all'}">
			    var addContent = '<div class="col-lg-4 col-md-6 mb-4"><div class="card h-100 bookbox"><a href="book_Read.do?book_num='+arr[i].num+'" class="book_img"><img class="card-img-top" src='+arr[i].image+' alt="" height="300px"></a><div class="card-body"><h4 class="card-title"><a href="book_Read.do?book_num='+arr[i].num+'">'+arr[i].title+'</a></h4><h5>'+arr[i].price+'원</h5><p class="card-text">'+arr[i].name+'</p></div><div class="card-footer"><small class="text-muted">'+stat+'</small></div></div></div>';
			      //listDiv에 추가되는 콘텐츠를 append
				$('div#listDiv').append(addContent);
				i++;
			</c:when>
   	 		<c:when test="${not empty catepre }">
			    var addContent = '<div class="col-lg-4 col-md-6 mb-4"><div class="card h-100 bookbox"><a href="book_Read.do?book_num='+arr[i].num+'" class="book_img"><img class="card-img-top" src='+arr[i].image+' alt="" height="300px"></a><div class="card-body"><h4 class="card-title"><a href="book_Read.do?book_num='+arr[i].num+'">'+arr[i].title+'</a></h4><h5>'+arr[i].price+'원</h5><p class="card-text">'+arr[i].name+'</p></div><div class="card-footer"><small class="text-muted">'+stat+'</small></div></div></div>';
			      //listDiv에 추가되는 콘텐츠를 append
				$('div#listDiv').append(addContent);
				i++;
			</c:when>
   	 		<c:when test="${not empty search }">
			    var addContent = '<div class="col-lg-4 col-md-6 mb-4"><div class="card h-100 bookbox"><a href="book_Read.do?book_num='+arr[i].num+'" class="book_img"><img class="card-img-top" src='+arr[i].image+' alt="" height="300px"></a><div class="card-body"><h4 class="card-title"><a href="book_Read.do?book_num='+arr[i].num+'">'+arr[i].title+'</a></h4><h5>'+arr[i].price+'원</h5><p class="card-text">'+arr[i].name+'</p></div><div class="card-footer"><small class="text-muted">'+stat+'</small></div></div></div>';
			      //listDiv에 추가되는 콘텐츠를 append
				$('div#listDiv').append(addContent);
				i++;
			</c:when>
		</c:choose>
			
   	 	
   	 }
 });
  
 
</script>



</html>
