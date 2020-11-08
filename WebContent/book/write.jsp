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
// content 용량 문제
var image;
var image, id;
var chk = false, cate = "0", gory = "0";
var id = (String)session.getAttribute("id");

//var id = (String)session.getAttribute("id");
//form validation 
// 글 제목, 책 정보, 책 판매 가격, 카테고리 필수
// 글 제목, 책 정보, 책 판매 가격, 카테고리 필수
function chkSubmit(){
	frm = document.forms['frm'];
	
	
	var name = frm["subject"].value.trim();
	var price = frm["price"].value.trim();
	var content = CKEDITOR.instances.editor1.getData();

	if(chk == false){
		alert("책 정보는 반드시 입력해야 합니다.");
		frm["search"].focus();
		return false;
	}
	
	if(subject == ""){
		alert("글 제목은 반드시 작성해야 합니다");
		frm["sunject"].focus();
		frm["subject"].focus();
		return false;
	}
	
	if(price == ""){
		alert("판매가는 반드시 작성해야 합니다");
		frm["price"].focus();
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

	submitPost({'sellid': id,
		'name': name,
		'price': price,
		'content': content,
		'cate': gory,
		'image': image});
		'image': image});
	
	return true;	
		
}

//submit 할때 parameter 값 능동적 주입
function submitPost(params){
	var form = document.forms['frm'];
	for(var key in params){
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", key);
		hiddenField.setAttribute("value", params[key]);
		form.appendChild(hiddenField);
	}
}

// 입력한 제목 값으로 ajax 책 검색 
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
			$("select#book").append("<option selected></option>");
			for(var i=0; i<msg.documents.length; i++){
				$("select#book").append("<option>"+msg.documents[i].title+"</option>");
			}
		});
}

// 공백확인
function isEmpty(value){
	if(value.length == 0 || value == null){
		return true;
	}else {
		return false;
	}
}

// 돈 3자리마다 ,표시
function currencyFormatter(amount){
	return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
}

function onlyNumberFunc(t){
	var regexp = /[^0-9]/gi;
	t.onkeyup = function(e){
	   var v = this.value;
	   this.value = v.replace(regexp,'');
	}
}

function imageShow(){
	var win = window.open("", "PopupWin", "width=260,height=320");
	win.document.write("<img style='width:250px;height:300px;' src='"+image+"'/>");
}


window.onload = function(){
	onlyNumberFunc(document.getElementById("price"))
}

$(function(){
	// 상위 카테고리 선택 시 하위 카테고리 셀렉트 박스 옵션 변경
	$('select#cate').change(function(){
		cate = this.value;
		switch(this.value){
		case '0':
			$("select#gory").empty();
			$("select#gory").append("<option value='0'>하위 카테고리</option>");
			break;
		case '1':
			$("select#gory").empty();
			$("select#gory").append("<option value='0' selected>하위 카테고리</option>");
			$("select#gory").append("<option value='101'>대학</option>");
			$("select#gory").append("<option value='102'>초중고</option>");
			$("select#gory").append("<option value='103'>외국어</option>");
			$("select#gory").append("<option value='104'>기타</option>");
			break;
		case '2':
			$("select#gory").empty();
			$("select#gory").append("<option value='0' selected>하위 카테고리</option>");
			$("select#gory").append("<option value='201'>공무원</option>");
			$("select#gory").append("<option value='202'>외국어능력시험</option>");
			$("select#gory").append("<option value='203'>기타</option>");
			break;
		case '3':
			$("select#gory").empty();
			$("select#gory").append("<option value='0' selected>하위 카테고리</option>");
			$("select#gory").append("<option value='301'>소년 만화</option>");
			$("select#gory").append("<option value='302'>스포츠</option>");
			$("select#gory").append("<option value='303'>미스테리</option>");
			$("select#gory").append("<option value='304'>요리</option>");
			$("select#gory").append("<option value='305'>웹툰</option>");
			$("select#gory").append("<option value='306'>기타</option>");
			break;
		case '4':
			$("select#gory").empty();
			$("select#gory").append("<option value='0' selected>하위 카테고리</option>");
			$("select#gory").append("<option value='401'>판타지</option>");
			$("select#gory").append("<option value='402'>라이트 노벨</option>");
			$("select#gory").append("<option value='403'>공상과학</option>");
			$("select#gory").append("<option value='404'>호러</option>");
			$("select#gory").append("<option value='405'>무협</option>");
			$("select#gory").append("<option value='406'>액션</option>");
			$("select#gory").append("<option value='407'>로맨스</option>");
			$("select#gory").append("<option value='408'>시</option>");
			$("select#gory").append("<option value='409'>기타</option>");
			break;
		case '5':
			$("select#gory").empty();
			$("select#gory").append("<option value='0' selected>하위 카테고리</option>");
			$("select#gory").append("<option value='501'>미술</option>");
			$("select#gory").append("<option value='502'>음악</option>");
			$("select#gory").append("<option value='503'>영화</option>");
			$("select#gory").append("<option value='504'>건축</option>");
			$("select#gory").append("<option value='505'>디자인</option>");
			$("select#gory").append("<option value='506'>기타</option>");
			break;
		case '6':
			$("select#gory").empty();
			$("select#gory").append("<option value='0' selected>하위 카테고리</option>");
			$("select#gory").append("<option value='601'>국내 여행</option>");
			$("select#gory").append("<option value='602'>유럽 여행</option>");
			$("select#gory").append("<option value='603'>아시아 여행</option>");
			$("select#gory").append("<option value='604'>아프리카 여행</option>");
			$("select#gory").append("<option value='605'>아메리카 여행</option>");
			$("select#gory").append("<option value='606'>기타</option>");
			break;
		case '7':
			$("select#gory").empty();
			$("select#gory").append("<option value='0' selected>하위 카테고리</option>");
			$("select#gory").append("<option value='701'>동화책</option>");
			$("select#gory").append("<option value='702'>유아 학습</option>");
			$("select#gory").append("<option value='703'>기타</option>");
			break;
		case '8':
			$("select#gory").empty();
			$("select#gory").append("<option value='0' selected>하위 카테고리</option>");
			$("select#gory").append("<option value='801'>국내 역사</option>");
			$("select#gory").append("<option value='802'>해외 역사</option>");
			$("select#gory").append("<option value='803'>기타</option>");
			break;
		case '9':
			$("select#gory").empty();
			$("select#gory").append("<option value='0' selected>하위 카테고리</option>");
			$("select#gory").append("<option value='901'>프로그래밍</option>");
			$("select#gory").append("<option value='902'>그래픽</option>");
			$("select#gory").append("<option value='903'>웹디자인</option>");
			$("select#gory").append("<option value='904'>오피스</option>");
			$("select#gory").append("<option value='905'>기타</option>");
			break;
		}
	})
	// 하위 카테고리 선택시 값 저장
	$('select#gory').change(function(){
		gory = this.value;
	})
	// 책 선택할때 본문에 책에 관한 내용 추가
	$('#book').change(function(){
		chk = true;
		$.ajax({
			method: "GET",
			url: "https://dapi.kakao.com/v3/search/book?target=title",
			data: { query: $('#book option:selected').text() },
			headers: {Authorization: "KakaoAK c6ccb05ef2ebd8a9d0a74ff173cc61f5"}
		})
			.done(function (msg){
				CKEDITOR.instances.editor1.setData("도서 제목: <strong>"+msg.documents[0].title+"</strong><br>"+
						"도서 소개 : <strong>"+msg.documents[0].contents+"</strong><br>"+
						"도서 상세 URL : <strong>"+msg.documents[0].url+"</strong><br>"+
						"국제 표준 도서번호 : <strong>"+msg.documents[0].isbn+"</strong><br>"+
						"도서 출판날짜 : <strong>"+msg.documents[0].datetime+"</strong><br>"+
						"도서 저자 : <strong>"+msg.documents[0].authors+"</strong><br>"+
						"도서 출판사 : <strong>"+msg.documents[0].publisher+"</strong><br>"+
						"도서 번역자 : <strong>"+msg.documents[0].translators+"</strong><br>"+
						"도서 정가 : <strong>"+msg.documents[0].price+"</strong><br>"+
						"도서 판매가 : <strong>"+msg.documents[0].sale_price+"</strong><br>"+
						"도서 판매 상태 정보 : <strong>"+msg.documents[0].status+"</strong><br>");
				image = msg.documents[0].thumbnail;
				$("#imgbut").show();
			});
	})
	
	$('#price').on('blur', function(){
		var val = $('#price').val();
		if(!isEmpty(val)){
			val = currencyFormatter(val);
			$('#price').val(val);
		}
	});
	
	$(document).ready(function(){
	      $("#imgbut").hide();

	})


})

</script>

<body>
<h2>책 판매글 작성</h2>
<%-- 글 내용이 많을수 있기 때문에 POST 방식 사용 --%>
<form name="frm" action="writeOk.do" method="post" onsubmit="return chkSubmit()">
<select name="cate" id="cate">
	<option value="0">상위 카테고리</option>
	<option value="1">교육</option>
	<option value="2">시험</option>
	<option value="3">만화</option>
	<option value="4">소설</option>
	<option value="5">예술</option>
	<option value="6">여행</option>
	<option value="7">유아</option>
	<option value="8">역사</option>
	<option value="9">IT</option>
</select>
<select name="gory" id="gory">
	<option value="0">하위 카테고리</option>
</select><br>
글 제목:
<input type="text" name="subject" placeholder="글 제목을 입력해주세요."/><br>
책 제목:
<input type="text" name="search" placeholder="책 제목을 입력하고 검색해주세요."/><button type="button" onclick="bookSearch()">검색</button>
<select name="book" id="book">
	<option>책 검색 결과</option>
</select>
<button type="button" id="imgbut" onclick="imageShow()">책 이미지 보기</button><br>
판매가:
<input type="text" id="price" name="price" placeholder="판매가격을 입력해주세요." style = "text-align:right"/>원<br>
<input type="text" id="price" name="price2" placeholder="판매가격을 입력해주세요." style = "text-align:right"/>원<br>
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