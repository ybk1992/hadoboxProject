<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
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
<title>수정-${list[0].subject }</title>
<script src="../ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="../CSS/writeFreeboard.css" rel="stylesheet">
</head>
<script>
function chkSubmit(){
	frm = document.forms["frm"];
	
	var subject = frm["subject"].value.trim();

    if (subject == "") {
        alert("제목은 반드시 작성해야 합니다");
        frm["subject"].focus();
        return false;
    }
    return true;
} // end chkSubmit()
</script>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
    <div class="container">
      <a class="navbar-brand" href="#">해도북스</a>
    </div>
  </nav>
  <div class="wrapper">
<h2>수정</h2>
<form name="frm" action="updateOk.do" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="uid" value="${list[0].uid }"/>
작성자: ${list[0].name }<br> <%-- 작성자 이름은 변경 불가 --%>
제목:
<input class="form-control search c1" type="text" name="subject" value="${list[0].subject }"/><br>
내용:<br>
<textarea name="content" id="editor2">${list[0].content }</textarea>
<script>
	CKEDITOR.replace('editor2', {
		allowedContent: false,   // HTML 태그 자동삭제 방지 설정
		width: '800px',      // 최초 너비, 높이 지정 가능
		height: '400px',
		filebrowserUploadUrl : '${pageContext.request.contextPath}/fileUpload.do'
	});
</script>
<br><br>
<input  class="btn btn-primary" type="submit" value="수정"/>
</form>
<br>
<button class="btn btn-primary" onclick="history.back();">이전으로</button>
<button class="btn btn-primary" onclick="location.href='list.do?list=all'">목록보기</button>
<br>
</div>
 <footer class="py-5 bg-dark">
    <div class="container">

      <p class="m-0 text-center text-white">
        <img src="../image/logo-white.png" alt="logo" id="footer_logo">
        Copyright &copy; 2020. (주)해도북스 컴퍼니. All right reserved.</p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>

	</c:otherwise>
</c:choose>
