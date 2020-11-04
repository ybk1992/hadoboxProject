<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="ckeditor/ckeditor.js"></script>
</head>

<script>
// form validation 
// '작성자(name)' 와 '제목(subject)' 는 필수
//var chk = false;
function chkSubmit(){
	frm = document.forms['frm'];
	
	var subject = frm["subject"].value.trim();
	
//	if(chk == false){
//		alert("책 정보는 반드시 입력해야 합니다.");
//		frm["search"].focus();
//		return false;
//	}
	
	if(subject == ""){
		alert("제목은 반드시 작성해야 합니다");
		frm["subject"].focus();
		return false;
	}
	
	return true;	
		
}

function bookSearch(){
	$.ajax({
		method: "GET",
		url: "https://dapi.kakao.com/v3/search/book?target=title",
		data: { query: $("input[name=search]").val() },
		headers: {Authorization: "KakaoAK c6ccb05ef2ebd8a9d0a74ff173cc61f5"}
	})
		.done(function (msg){
			console.log(msg.documents.length);
			$("select#book").empty();
			for(var i=0; i<msg.documents.length; i++){
				$("select#book").append("<option>"+msg.documents[i].title+"</option>");
			}
		});
}

$(function(){
	$('#book').change(function(){
		$.ajax({
			method: "GET",
			url: "https://dapi.kakao.com/v3/search/book?target=title",
			data: { query: $('#book option:selected').text() },
			headers: {Authorization: "KakaoAK c6ccb05ef2ebd8a9d0a74ff173cc61f5"}
		})
			.done(function (msg){
				CKEDITOR.instances.editor1.setData("<img src='"+msg.documents[0].thumbnail+"'/><br><strong>"+msg.documents[0].title+"</strong>"+
						"<strong>"+msg.documents[0].contents+"</strong><br>"+
						"<strong>"+msg.documents[0].url+"</strong><br>"+
						"<strong>"+msg.documents[0].isbn+"</strong><br>"+
						"<strong>"+msg.documents[0].datetime+"</strong><br>"+
						"<strong>"+msg.documents[0].authors[0]+"</strong><br>"+
						"<strong>"+msg.documents[0].publisher+"</strong><br>"+
						"<strong>"+msg.documents[0].translators[0]+"</strong><br>"+
						"<strong>"+msg.documents[0].price+"</strong><br>"+
						"<strong>"+msg.documents[0].sale_price+"</strong><br>"+
						"<strong>"+msg.documents[0].status+"</strong><br>");
			});
	})
})

</script>

<body>
<h2>책 판매글 작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()">
글 제목:
<input type="text" name="subject"/><br>
책 제목:
<input type="text" name="search"/><button type="button" onclick="bookSearch()">검색</button><br>
<select name="book" id="book">
	<option>책 검색 결과</option>
</select><br>
내용:<br>
<textarea name="content" id="editor1"></textarea>
<script>
	CKEDITOR.replace('editor1', {
		allowedContent: true,   // HTML 태그 자동삭제 방지 설정
		width: '800px',      // 최초 너비, 높이 지정 가능
		height: '400px',
		filebrowserUploadUrl : '${pageContext.request.contextPath}/fileUpload.do'
	});
	CKEDITOR.instances.editor1.setData()
</script>
<br><br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='list.do'">목록으로</button>
</body>





</html>