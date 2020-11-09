<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

</script>
<title>아이디 찾기</title>
</head>
<body>
<br>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기</h3>
			</div>
			<div>
				<form name="frm" action="sendIdPw.do" method="post" >

				<p>
				
					<label>이름</label>
					<input class="w3-input" type="text" id="mem_username" name="mem_username" required>
				</p>
				<p>
					<label>Email</label>
					<input class="w3-input" type="text" id="mem_email" name="mem_email" required>
				</p>
				<p class="w3-center">
				<input type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value="등록"/>

				</p>
				
				</form>
			</div>
		</div>
	</div>
</body>
</html>