<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<title>${book_List[0].book_num }</title>
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
  <link href="CSS/read_page.css" rel="stylesheet">

</head>
<script>
function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.do?book_num=' + uid;
	}
} // chkDelete
</script>
<body>
 <!-- 페이지 상단 navbar -->
 <jsp:include page="../header.jsp"></jsp:include>

<c:set var="status" value="${book_List[0].book_status }" />

<div class="container" id="content">
    <div class="row">
        <div class="col-md-5">
        	<img src="${book_List[0].book_image }" alt="" height="300px">
        </div>
        
        <div class="col-md-6 info">
        	<div class="row">
        		 <div class="col-md-12 title" style="font-weight: bold;">${book_List[0].book_title }</div>
        	</div>
        	<div class="row">
        		<div class="col-md-8" id="cate" style="text-align: right;">${book_List[0].book_cate_name } > ${book_List[0].book_cate_pre }</div>
        		<div class="col-md-4" id="viewcnt">조회수  ${book_List[0].book_viewcnt }</div>
        	</div>
        	<div class="row">
        		<div class="col-md-12 price">${book_List[0].book_price } 원</div>
        	</div>
        	<div class="row">
        		<div class="col-md-12 content">${book_List[0].book_content }</div>
        	</div>
        		
        </div>
    </div>
    <div class="row">
        <div class="col-md-11 seller">
        	<p style="text-align:left; ">판매자		${book_List[0].book_sellid }</p>
        	<c:if test="${mem_userid eq book_List[0].book_sellid}">
	        	<button class="btn btn-secondary" onclick="location.href='update.do?book_num=${book_List[0].book_num}'">수정하기</button>
				<button class="btn btn-secondary" onclick="location.href='book_List.do'">목록보기</button>
				<button class="btn btn-secondary" onclick="chkDelete(${book_List[0].book_num })">삭제하기</button>
				<button class="btn btn-secondary" onclick="location.href='write.do'">신규등록</button>
			</c:if>
        </div>
    </div>
    
	<c:choose>
	    <c:when test="${book_List[0].book_status eq '0'}">
	        <c:set var="status" value="판매완료"/>
	        <div class="row soldout">
		        <div class="col-md-12">${status}</div>
		    </div>
	    </c:when>
	    <c:when test="${book_List[0].book_status eq '1'}">
	    	<c:if test="${memLogin==true}">
		        <c:set var="status" value="판매중"/>
			    <div class="row doComment">
			        <div class="col-md-9"><input type="text" id="answerInput" class="form-control" placeholder="댓글을 입력해주세요."></div>
			        <div class="col-md-2"><button class="btn btn-dark" onclick="insertClick()">댓글쓰기</button></div>
			    </div>
			    <div class="row viewComment">
			    	<c:forEach var="dto" items="${ansSelect }" end="${fn:length(ansSelect)}">
				        <div class="col-md-2">${dto.an_id}</div>
				        <div class="col-md-9" style="text-align:left">${dto.an_content}</div>
			    	</c:forEach>
			        
			    </div>
		    </c:if>
	    </c:when>
	</c:choose>
			
</div>
  
  <!-- Footer -->
 <jsp:include page="../footer.jsp"></jsp:include>
  
  <script>
	function insertClick(){
		//}+'+&answer='+$('input#answerInput').val();
		const url = 'book_Read.do?book_num='+${book_List[0].book_num}+'&answer='+$('input#answerInput').val();
		location.href = url;
		
	}
  </script>
  
</body>
</html>

	</c:otherwise>
</c:choose>