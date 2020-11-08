<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
<!DOCTYPE html>
<html>

<head>
  <title>해도북스 중고책 거래 사이트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>

<script>
// form validation 
function delete_check(){
		var answer;
		answer = confirm("탈퇴 하시겠습니까?");
		//확인을 선택한 경우 자바스크립트를 호출할 때 같이 넘어온 url이라는 변수에 들어있는 주소로 페이지 이동
		if(answer == true){
			
	        $.ajax({
	            type:"POST",
	            url:"delete.do",
	            data:{
	                "mem_userid": $('#mem_userid').val()
	            },
	            success:function(data){
	            	
	            	

	            }
	        });    
}
}

function mailCheckFunc(){
        $.ajax({
            type:"POST",
            url:"mailOk.do",
            data:{
                "mem_email": $('#mem_email').val()
            },
            success:function(data){
                if($.trim(data) == "YES"){
                    //alert('사용가능');
                    $('#emailchk').html('<b style="font-size:13px;color:blue">중복되지 않는 메일입니다.</b>');
                }else{
                    //alert('사용불가');
                    $('#emailchk').html('<b style="font-size:13px;color:red">이미 사용 중인 메일입니다.</b>');
                }
            }
        });    

}
function chkSubmit(){
	frm = document.forms['frm'];
	var mem_password = frm["mem_password"].value.trim();
	var mem_password1 = frm['mem_password1'].value.trim();
	var mem_phone = frm['mem_phone'].value.trim();
	var mem_email = frm['mem_email'].value.trim();
	var mem_zipcode = frm['mem_zipcode'].value.trim();
	var mem_address1 = frm['mem_address1'].value.trim();
	var mem_address2 = frm['mem_address2'].value.trim();
	var mem_image = frm['mem_image'].value.trim();
	

	var expPwText = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
	var expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
	var expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
    

	
    if(expPwText.test(mem_password) == false){
        alert('비밀번호를 확인하세요.');
		frm["mem_password"].focus();
        return false;
    }
	
    if(mem_password != mem_password1){
        alert('비밀번호와 비밀번호 확인의 값이 서로 다릅니다.');
		frm["mem_password1"].focus();
        return false;
    }
    

    if(expEmailText.test(mem_email) == false){
        alert('이메일을 확인하세요.');
		frm["mem_email"].focus();
        return false;
    }
    
    //폰 입력했다면,
    if(expHpText.test(mem_phone) == false && mem_phone != ""){
        alert('휴대폰 번호 형식을 확인하세요. 010-1234-5678');
		frm["mem_phone"].focus();

        return false;
    }
	
	return true;			
}

function modifyPw(){
    $('#mem_password').val('');
    $('#mem_password1').val('');

	frm["mem_password"].focus();
    $('#pwchk').html('<b style="font-size:13px;color:red">수정 후 하단의 저장 버튼을 눌러주세요</b>');
 
}

function modifyPhone(){
    $('#mem_phone').val('');

	frm["mem_phone"].focus();
    $('#phonechk').html('<b style="font-size:13px;color:red">수정 후 하단의 저장 버튼을 눌러주세요</b>');
 
}
function modifyEmail(){
    $('#mem_email').val('');
	frm["mem_email"].focus();
    $('#emailchk').html('<b style="font-size:13px;color:red">수정 후 하단의 저장 버튼을 눌러주세요</b>');
 
}

function modifyImg(){
    $('#mem_image').val('');

	frm["mem_image"].focus();
    $('#imgchk').html('<b style="font-size:13px;color:red">수정 후 하단의 저장 버튼을 눌러주세요</b>');
 
}

</script>
<body>
<div class="text-center" style="margin-bottom:0">
  <h1>해도북스</h1>
  <p>중고책을 찾아보세요</p> 
</div>
<jsp:include page="../header.jsp"></jsp:include>

<div class="container">
<br>
  <h2>마이페이지</h2>
  <b style="font-size:14px;color:green">내 정보를 수정하세요___________</b>
  <form name="frm" action="myPageOk.do" class="was-validated" method="post" onsubmit="return chkSubmit()">
    <div class="form-group">
      <label for="mem_userid">아이디 :</label>
      <input type="text" class="form-control" id="mem_userid" name="mem_userid" value="${MyInfo[0].mem_userid}" disabled>
      <label for="mem_username">이름 :</label>
      <input type="text" class="form-control" id="mem_username" name="mem_username" value="${MyInfo[0].mem_username}" disabled>
    </div>
    <div class="form-group">
      <label for="mem_password">비밀번호 :</label>
      <input type="password" class="form-control" id="mem_password" name="mem_password" value="${MyInfo[0].mem_password}">
      <label for="mem_password">비밀번호 확인 :</label>
      <input type="password" class="form-control" id="mem_password1" name="mem_password1" value="${MyInfo[0].mem_password}">
      <input type="button" class="btn btn-success" onclick="modifyPw()" value="수정"><br>
      <span id="pwchk"></span><br>
    </div>
    <div class="form-group">
      <label for="mem_phone">핸드폰 번호 :</label>
      <input type="text" class="form-control" id="mem_phone" name="mem_phone" value="${MyInfo[0].mem_phone}">
      <input type="button" class="btn btn-success" onclick="modifyPhone()" value="수정"><br>
      <span id="phonechk"></span><br>
    </div>  
      
    <div class="form-group">
      <label for="mem_email">이메일 :</label>
      <input type="text" class="form-control" id="mem_email" name="mem_email" value="${MyInfo[0].mem_email}">
      
      <input type="button" class="btn btn-success" onclick="modifyEmail()" value="수정">
      <input type="button" class="btn btn-success" onclick="mailCheckFunc()" value="중복 검사"><br>
      <span id="emailchk"></span><br>
    </div>    
    <div class="form-group">
      <label for= "mem_zipcode">우편 번호 :</label>
      <input type="text" class="form-control" id="mem_zipcode" name="mem_zipcode" value="${MyInfo[0].mem_zipcode}">
      <input type="button" class="btn btn-success" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
      <label for="mem_phone">주소 :</label>      
      <input type="text" class="form-control" id="mem_address1" name="mem_address1" value="${MyInfo[0].mem_address1}">
      <label for="mem_phone">상제 주소 :</label>      
      <input type="text" class="form-control" id="mem_address2" name="mem_address2" value="${MyInfo[0].mem_address2}">
      <span id="adchk"></span><br>
    </div>    
    <div class="form-group">
      <label for="mem_image">이미지 :</label>
      <input type="file" class="form-control" id="mem_image" name="mem_image" value="${MyInfo[0].mem_image}"><br>
      <span id="imgchk"></span>
    </div> 
    <button type="submit" class="btn btn-primary">저장</button>
  </form>
  <br>
  <b style="font-size:14px;color:red">탈퇴를 원하시면 탈퇴하기 버튼을 눌러주세요.___________</b>
  <input type="button" class="btn btn-danger" value="탈퇴하기" onclick="delete_check()"><br>

</div>
<br>
<br>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

    <script>

        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.

        function sample4_execDaumPostcode() {

            new daum.Postcode(

                    {

                        oncomplete : function(data) {

                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

 

                            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.

                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

                            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수



                            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

 

                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)

                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.

                            if (data.bname !== ''

                                    && /[동|로|가]$/g.test(data.bname)) {

                                extraRoadAddr += data.bname;

                            }

                            // 건물명이 있고, 공동주택일 경우 추가한다.

                            if (data.buildingName !== ''

                                    && data.apartment === 'Y') {

                                extraRoadAddr += (extraRoadAddr !== '' ? ', '

                                        + data.buildingName : data.buildingName);

                            }

                            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.

                            if (extraRoadAddr !== '') {

                                extraRoadAddr = ' (' + extraRoadAddr + ')';

                            }

                            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.

                            if (fullRoadAddr !== '') {

                                fullRoadAddr += extraRoadAddr;

                            }

 

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.

                            document.getElementById('mem_zipcode').value = data.zonecode; //5자리 새우편번호 사용

                            document.getElementById('mem_address1').value = fullRoadAddr;
                            $('#mem_address2').val('');

                            document.getElementById("mem_address2").focus();
                            

                            $('#adchk').html('<b style="font-size:13px;color:red">수정 후 하단의 저장 버튼을 눌러주세요</b>');

                        }

                    }).open();
            


            new daum.Postcode({
                onclose: function(state) {
                    //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
                    if(state === 'FORCE_CLOSE'){
                        //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.
                    } else if(state === 'COMPLETE_CLOSE'){
                        //사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
                        //oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
                    }
                }
            });    

        }

    </script>
 

<jsp:include page="../footer.jsp"></jsp:include>


</body>

</html>
