var image, name;
var chk = false, cate = "0", gory = "0";


// 글 제목, 책 정보, 책 판매 가격, 카테고리 필수
function chkSubmit(){
	frm = document.forms['frm'];
	var title = frm["title"].value.trim();
	var price = frm["price"].value.trim();

	if(chk == false){
		alert("책 정보는 반드시 입력해야 합니다.");
		frm["search"].focus();
		return false;
	}
	
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

	submitPost({'sellid': "apple123",
		'name' : name,
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
				name = msg.documents[0].title;
				$("#imgbut").show();
			});
	})
	
	$(document).ready(function(){
	      $("#imgbut").hide();
	})


})
