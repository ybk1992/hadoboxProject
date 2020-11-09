<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%  // Controller 로부터 결과 데이터 받음.
	int cnt = (Integer)request.getAttribute("result");
%>

<% if(cnt == 0){ %>
	<script>
		alert("이름과 이메일을 확인해주세요.");
		history.back();
	</script>
<% } %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "sendMail.do",
				type : "POST",
				data : {
					mem_userid : $("#mem_userid").val(),
					mem_email : $("#mem_email").val(),
				},
				success : function(result) {
					alert("메일로 임시 비밀번호를 발송하였습니다.");
					location.href="login.do";
				},
			})
		});
	})
</script>
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label>${MyIdPw[0].mem_username}님 아이디 </label>
					<input class="w3-input" type="text" id="mem_userid" name="mem_userid" value="${MyIdPw[0].mem_userid}" disabled>
				</p>
				<p>
					<label>비밀번호를 잊으셨나요? 버튼클릭 시 이메일로 임시 비밀번호를 보내드립니다.</label>
				</p>
				<p class="w3-center">
				    <input class="w3-input" type="text" id="mem_email" name="mem_email" value="${MyIdPw[0].mem_email}" disabled>
					<button type="button" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">위의 메일로 임시비밀번호 받기</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>