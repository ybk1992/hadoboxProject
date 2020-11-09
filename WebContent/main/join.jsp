<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>

<script>
// form validation 

function idCheckFunc(){
        $.ajax({
            type:"POST",
            url:"idOk.do",
            data:{
                "mem_userid": $('#mem_userid').val()
            },
            success:function(data){
                if($.trim(data) == "YES"){
                    //alert('사용가능');
                    $('#idchk').html('<b style="font-size:18px;color:blue">중복되지 않는 아이디입니다.</b>');
                }else if($.trim(data) == "NOEMPTY"){
                    //alert('사용불가');
                    $('#idchk').html('<b style="font-size:18px;color:red">공백을 포함할 수 없습니다.</b>');
                
                }
                else{
                    //alert('사용불가');
                    $('#idchk').html('<b style="font-size:18px;color:red">이미 사용 중인 아이디 입니다.</b>');
                }
            }
        });    

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
                    $('#mchk').html('<b style="font-size:18px;color:blue">중복되지 않는 메일입니다.</b>');
                }else{
                    //alert('사용불가');
                    $('#mchk').html('<b style="font-size:18px;color:red">이미 사용 중인 메일입니다.</b>');
                }
            }
        });    

}


function chkSubmit(){
	frm = document.forms['frm'];
	
	var mem_userid = frm["mem_userid"].value.trim();
	var mem_password = frm["mem_password"].value.trim();
	var mem_password1 = frm['mem_password1'].value.trim();
	var mem_username = frm['mem_username'].value.trim();
	var mem_phone = frm['mem_phone'].value.trim();
	var mem_email = frm['mem_email'].value.trim();
	var mem_zipcode = frm['mem_zipcode'].value.trim();
	var mem_address1 = frm['mem_address1'].value.trim();
	var mem_address2 = frm['mem_address2'].value.trim();
	var mem_image = frm['mem_image'].value.trim();
	

	var expPwText = /^.*(?=^.{4,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&*()+=]).*$/;
	var expNameText = /[가-힣]+$/;
	var expHpText = /^\d{3}-\d{3,4}-\d{4}$/;
	var expEmailText = /^[A-Za-z0-9\.\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z0-9\.\-]+$/;
    
	if(mem_userid == ""){
		alert("아이디 란은 반드시 입력해야 합니다.");
		frm["mem_userid"].focus();
		return false;
	}
	 
    
	if($("#idchk").text() != "중복되지 않는 아이디입니다."){
		alert("아이디 중복 확인을 해주세요.");
		return false;
	}
	 

	if(mem_password == ""){
		alert("비밀번호 란은 반드시 작성해야 합니다") ;
		frm["mem_password"].focus();
		return false;
	}
	
    if(expPwText.test(mem_password) == false){
        alert('비밀번호 형식을 확인하세요.');
		frm["mem_password"].focus();
        return false;
    }
	
    if(mem_password != mem_password1){
        alert('비밀번호와 비밀번호 확인의 값이 서로 다릅니다.');
		frm["mem_password1"].focus();
        return false;
    }
    
    if(expNameText.test(mem_username) == false){
        alert('이름 형식을 확인하세요.');
		frm["mem_username"].focus();

        return false;
    }
    
    if(expEmailText.test(mem_email) == false){
        alert('이메일 형식을 확인하세요.');
		frm["mem_email"].focus();
        return false;
    }
    
    //폰 입력했다면,
    if(expHpText.test(mem_phone) == false && mem_phone != ""){
        alert('휴대폰 번호 형식을 확인하세요.');
		frm["mem_phone"].focus();

        return false;
    }
	
	return true;			
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
  <h2>회원가입</h2>
  <form name="frm" action="joinOk.do" method="post" onsubmit="return chkSubmit()" enctype="Multipart/form-data">
      <div class="form-group">
      <label for="mem_userid">아이디 :</label>
      <input type="text" class="form-control" id="mem_userid" name="mem_userid"/>
      <input type="button" class="btn btn-primary box" onclick="idCheckFunc()" value="중복확인"><br>
	  <span id="idchk"></span>
    </div>
    <div class="form-group">
      <label for="mem_username">이름 :</label>
      <input type="text" class="form-control" id="mem_username" name="mem_username">
      <label for="mem_password">비밀번호 :</label>
      <input type="password" class="form-control" id="mem_password" name="mem_password">
      <label for="mem_password">비밀번호 확인 :</label>
      <input type="password" class="form-control" id="mem_password1" name="mem_password1">
      <span id="pwchk"></span><br>
    </div>
    <div class="form-group">
      <label for="mem_phone">핸드폰 번호 :</label>
      <input type="text" class="form-control" id="mem_phone" name="mem_phone">
      <span id="phonechk"></span><br>
    </div>  
      
    <div class="form-group">
      <label for="mem_email">이메일 :</label>
      <input type="text" class="form-control" id="mem_email" name="mem_email">
      
      <input type="button" class="btn btn-primary" onclick="mailCheckFunc()" value="중복 확인"><br>
      <span id="mchk"></span><br>
    </div>    
    <div class="form-group">
      <label for= "mem_zipcode">우편 번호 :</label>
      <input type="text" class="form-control" id="sample4_postcode" name="mem_zipcode">
      <input type="button" class="btn btn-primary" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
      <label for="mem_phone">주소 :</label>      
      <input type="text" class="form-control" id="sample4_roadAddress" name="mem_address1">
      <label for="mem_phone">상제 주소 :</label>      
      <input type="text" class="form-control" id="sample4_detailAddress" name="mem_address2">
    </div>    
    <div class="form-group">
      <label for="mem_image">이미지 :</label>
      <input type="file" class="form-control" id="mem_image" name="mem_image"><br>
    </div> 
    <button type="submit" class="btn btn-primary">등록</button>
  </form>
  <br>
</div>
 
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

                            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용

                            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                            
                            document.getElementById("sample4_detailAddress").focus();


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
