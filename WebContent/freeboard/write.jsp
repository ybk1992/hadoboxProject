<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<script src="../ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="../CSS/writeFreeboard.css" rel="stylesheet">
</head>
<script>
var id = ${mem_userid};
// form validation 
// '작성자(name)' 와 '제목(subject)' 는 필수
function chkSubmit(){
	frm = document.forms['frm'];
	
	var name = frm["name"].value.trim();
	var subject = frm["subject"].value.trim();
	
	if(name == ""){
		alert("작성자 란은 반드시 입력해야 합니다.");
		frm["name"].focus();
		return false;
	}
	
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["subject"].focus();
		return false;
	}
	
	return true;	
		
}


</script>
<%

// 세션생성

HttpSession session11 = request.getSession();      
String LoginID = (String)session11.getAttribute("mem_userid");

%>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
    <div class="container">
      <a class="navbar-brand" href="#">해도북스</a>
    </div>
  </nav>
<div class="wrapper">
<h2>글작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>

<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()">
작성자:
<input class="form-control search c1" value= "<%= LoginID %>"type="text" name="name" disabled/><br>
제목:
<input class="form-control search c1" type="text" name="subject"/><br>
내용:<br>
<textarea name="content" id="editor1"></textarea>
<script>
	CKEDITOR.replace('editor1', {
		allowedContent: true,   // HTML 태그 자동삭제 방지 설정
		width: '800px',      // 최초 너비, 높이 지정 가능
		height: '400px',
		filebrowserUploadUrl : '${pageContext.request.contextPath}/fileUpload.do'
	});
</script>
<br><br>
<input class="btn btn-primary" type="submit" value="등록"/>
</form>

<br>
<button class="btn btn-primary" type="button" onclick="location.href='list.do'">목록으로</button>
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