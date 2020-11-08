<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>
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
<title>수정-${book_List[0].book_title }</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="ckeditor/ckeditor.js"></script>
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

function imageShow(){
	var win = window.open("", "PopupWin", "width=260,height=320");
	win.document.write("<img style='width:250px;height:300px;' src='${book_List[0].book_image}'/>");
}
</script>

<body>
<h2>수정</h2>
<form name="frm" action="updateOk.do" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="uid" value="${book_List[0].book_num }"/>
<select name="cate" id="cate">
	<option>${book_List[0].book_cate_name }</option>
</select>
<select name="gory" id="gory">
	<option>${book_List[0].book_cate_pre }</option>
</select><br>
글 제목:
<input type="text" name="subject" value="${book_List[0].book_title }"/><br>
책 제목: ${book_List[0].book_name }
<button type="button" id="imgbut" onclick="imageShow()">책 이미지 보기</button><br>
판매가:
<input type="text" id="price" name="price2" value="${book_List[0].book_price }" style = "text-align:right"/>원<br>
내용:<br>
<textarea name="content" id="editor1">${book_List[0].book_content }</textarea>
<script>
	CKEDITOR.replace('editor1', {
		allowedContent: true,   // HTML 태그 자동삭제 방지 설정
		width: '1000px',      // 최초 너비, 높이 지정 가능
		height: '400px',
		filebrowserUploadUrl : '${pageContext.request.contextPath}/fileUpload.do'
	});
</script>
<br><br>
<input type="submit" value="수정"/>
</form>
<button onclick="history.back();">이전으로</button>
<button onclick="location.href='book_List.do'">목록보기</button>
<br>
</body>
</html>

	</c:otherwise>
</c:choose>
