<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="ckeditor/ckeditor.js"></script>
</head>
<script>
var arr = new Array();
<c:forEach items="${cate_List}" var="item">
	arr.push({val:"${item.book_cate}"
		,cate: "${item.book_cate_name}"
		,gory: "${item.book_cate_pre}"
		});
</c:forEach>
$(function(){
	$('select#cate').change(function(){
		cate = this.value;
		$("select#gory").empty();
		$("select#gory").append("<option value='0'>하위 카테고리</option>");
		for(var i=0; i<arr.length; i++){
			if(cate == arr[i].cate){
				$("select#gory").append("<option value='"+arr[i].val+"'>"+arr[i].gory+"</option>");
			}
		}
		
	})
});
</script>
<body>
<h2>책 판매글 작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()">
<select name="cate" id="cate">
	<option value="0">상위 카테고리</option>
	<option value="교육">교육</option>
	<option value="시험">시험</option>
	<option value="만화">만화</option>
	<option value="소설">소설</option>
	<option value="예술">예술</option>
	<option value="여행">여행</option>
	<option value="유아">유아</option>
	<option value="역사">역사</option>
	<option value="IT">IT</option>
</select>
<select name="gory" id="gory">
	<option value='0'>하위 카테고리</option>
</select><br>
글 제목:
<input type="text" name="title" placeholder="글 제목을 입력해주세요."/><br>
책 제목:
<input type="text" name="search" placeholder="책 제목을 입력하고 검색해주세요."/><button type="button" onclick="bookSearch()">검색</button>
<select name="book" id="book">
	<option>책 검색 결과</option>
</select>
<button type="button" id="imgbut" onclick="imageShow()">책 이미지 보기</button><br>
판매가:
<input type="text" id="price" name="price" placeholder="판매가격을 입력해주세요." style = "text-align:right"/>원<br>
내용:<br>
<textarea name="content" id="editor1"></textarea>
<script>
	CKEDITOR.replace('editor1', {
		allowedContent: true,   // HTML 태그 자동삭제 방지 설정
		width: '1000px',      // 최초 너비, 높이 지정 가능
		height: '400px',
		filebrowserUploadUrl : '${pageContext.request.contextPath}/fileUpload.do'
	});
</script>
<br><br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href='list.do'">목록으로</button>
<script src="JS/write.js" type="text/javascript"></script>
</body>





</html>