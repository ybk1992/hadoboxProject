<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
  <link href="CSS/main.css" rel="stylesheet">
</head>
<body>

<%--공통--------------------------------------------------------------------------%>
<div class="text-center" style="margin-bottom:0">
  <h1>해도북스</h1>
  <p>Resize this responsive page to see the effect!</p> 
</div>
<jsp:include page="../header.jsp"></jsp:include>

  <!-- Page Content -->
  <div class="container">

    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      <h1 class="display-3">A Warm Welcome!</h1>
      <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
       <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form>
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="email" class="form-control form-control-lg" placeholder="책 정보를 입력하세요">
              </div>
              <div class="col-12 col-md-3">
                <button type="submit" class="btn btn-block btn-lg btn-primary">찾기</button>
              </div>
            </div>
          </form>
        </div>
            
         </header>

    <!-- Page Features -->
    <div class="row text-center">
	<c:choose>	
		<c:when test="${empty book_List || fn:length(book_List) == 0 }"> 
			</c:when>
			
			<c:otherwise> 
				<script>
				</script>
				<c:forEach var="dto" items="${book_List }" end="3">
			      <div class="col-lg-3 col-md-6 mb-4">
			        <div class="card h-100">
			          <img class="card-img-top" src="${dto.book_image }" alt="" height="300px">
			          <div class="card-body">
			            <h4 class="card-title">${dto.book_title }</h4>
			            <p class="card-text">${dto.book_name }</p>
			          </div>
			          <div class="card-footer">
			            <a href="book_Read.do?book_num=${dto.book_num }" class="btn btn-primary">Find Out More!</a>
			          </div>
			        </div>
			      </div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>
