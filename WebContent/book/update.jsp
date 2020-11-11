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
<script src="ckeditor/ckeditor.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
  </script>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
</head>
<script>
var arr = new Array();
<c:forEach items="${cate_List}" var="item">
	arr.push({val:"${item.book_cate}"
		,cate: "${item.book_cate_name}"
		,gory: "${item.book_cate_pre}"
		});
</c:forEach>
var cateChk = "${book_List[0].book_cate_name }";
var goryChk = "${book_List[0].book_cate_pre }";

function chkSubmit(){
	frm = document.forms["frm"];
	
	var title = frm["title"].value.trim();
	var price = frm["price"].value.trim();
	var cate = frm["cate"].value.trim();
	var gory = frm["gory"].value.trim();
	var status = frm["status"].value.trim();

	if(title == ""){
		alert("글 제목은 반드시 작성해야 합니다");
		frm["title"].focus();
		return false;
	}
	
	if(price == ""){
		alert("판매가는 반드시 작성해야 합니다");
		frm["price"].focus();
		return false;
	}
	
	if(status == ""){
		alert("판매여부는 반드시 체크해야 합니다");
		return false;
	}
	
	if(cate <= 0){
		alert("카테고리는 반드시 하위 카테고리까지 선택해야 합니다");
		document.frm.cate.focus();
		return false;
	}

	if(gory <= 0){
		alert("카테고리는 반드시 하위 카테고리까지 선택해야 합니다");
		document.frm.gory.focus();
		return false;
	}
    return true;
} // end chkSubmit()

function imageShow(){
	var win = window.open("", "PopupWin", "width=260,height=320");
	win.document.write("<img style='width:250px;height:300px;' src='${book_List[0].book_image}'/>");
}

function onlyNumberFunc(t){
	var regexp = /[^0-9]/gi;
	t.onkeyup = function(e){
	   var v = this.value;
	   this.value = v.replace(regexp,'');
	}
}

window.onload = function(){
	
	onlyNumberFunc(document.getElementById("price"));
	
	for(var i=0; i<arr.length-1; i++){
		if(arr[i].cate != arr[i+1].cate){
			if(arr[i].cate == cateChk)
				$("select#cate").append("<option value='"+arr[i].cate+"' selected>"+arr[i].cate+"</option>");
			else
				$("select#cate").append("<option value='"+arr[i].cate+"'>"+arr[i].cate+"</option>");
		}	
	}
	$("select#cate").append("<option value='"+arr[arr.length-1].cate+"'>"+arr[arr.length-1].cate+"</option>");
	
	$("select#gory").empty();
	$("select#gory").append("<option value='0'>하위 카테고리</option>");
	for(var i=0; i<arr.length; i++){
		if(cateChk == arr[i].cate){
			if(arr[i].gory == goryChk)
				$("select#gory").append("<option value='"+arr[i].val+"' selected>"+arr[i].gory+"</option>");
			else
				$("select#gory").append("<option value='"+arr[i].val+"'>"+arr[i].gory+"</option>");
		}
	}
	
}

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
<jsp:include page="../header.jsp"></jsp:include>
<body>
<h2>판매글 수정하기</h2>
<form name="frm" action="updateOk.do" method="post" onsubmit="return chkSubmit()">
<input type="hidden" name="uid" value="${book_List[0].book_num }"/>
<h3><input type="radio" name="status" value="1">판매중</h3><h3><input type="radio" name="status" value="0">판매완료</h3>
<select name="cate" id="cate">
<option value="0">상위 카테고리</option>
</select>
<select name="gory" id="gory">
</select><br>
글 제목:
<input type="text" name="title" value="${book_List[0].book_title }"/><br>
책 제목: ${book_List[0].book_name }
<button type="button" id="imgbut" onclick="imageShow()">책 이미지 보기</button><br>
판매가:
<input type="text" id="price" name="price" value="${book_List[0].book_price }" style = "text-align:right"/>원<br>
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
<button onclick="location.href='book_List.do?list=all'">목록보기</button>
<br>
</body>
</html>

	</c:otherwise>
</c:choose>
