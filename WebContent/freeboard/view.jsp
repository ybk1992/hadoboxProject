<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="com.lec.beans.*" %>
<%	// Controller  로부터 결과 데이터 받음
	WriteDTO [] arr = (WriteDTO [])request.getAttribute("list");
%>

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
<title>읽기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="../CSS/viewFreeboard.css"/>
</head>
<script>

function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.do?uid=' + uid;
	}
} // chkDelete

</script>
<% 
//세션생성

HttpSession session11 = request.getSession();      
String LoginID = (String)session11.getAttribute("mem_userid");

%>


<body>	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
    <div class="container">
      <a class="navbar-brand" href="#">해도북스</a>
    </div>
  </nav>
		<br>
		<div class="wrapper">
		
		작성자 : ${list[0].name }<br>
		제목: ${list[0].subject }<br>
		등록일: ${list[0].regDate }<br>
		조회수: ${list[0].viewCnt }<br>
		내용: <br>
		<%=LoginID %>
		<hr>
		<div>
		${list[0].content }	
		</div>
		<hr>
		<br>
     	
         <% if(LoginID.equals(arr[0].getName())) {%>
     		 <button class="btn btn-primary" onclick="location.href='update.do?uid=${list[0].uid }'">수정하기</button>
      		 <button class="btn btn-primary" onclick="chkDelete(${list[0].uid })">삭제하기</button>
         <%} %>
      		
		<button class="btn btn-primary" onclick="location.href='list.do'">목록보기</button>
		<button class="btn btn-primary" onclick="location.href='write.do'">신규등록</button>
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

