<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<c:choose>
	<c:when test="${empty listFreeboard || fn:length(listFreeboard) == 0 }">
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
<title>읽기</title>
</head>
<script>

function chkDelete(uid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.do?uid=' + uid;
	}
} // chkDelete

</script>
<body>	
	<h2>항목 보기</h2>
		<br>
		uid : ${listFreeboard[0].uid }<br>
		작성자 : ${listFreeboard[0].name }<br>
		제목: ${listFreeboard[0].subject }<br>
		등록일: ${listFreeboard[0].regDate }<br>
		조회수: ${listFreeboard[0].viewCnt }<br>
		내용: <br>
		<hr>
		<div>
		${listFreeboard[0].content }
		</div>
		<hr>
		<br>
		<button onclick="location.href='update.do?uid=${listFreeboard[0].uid }'">수정하기</button>
		<button onclick="location.href='listFreeboard.do'">목록보기</button>
		<button onclick="chkDelete(${listFreeboard[0].uid })">삭제하기</button>
		<button onclick="location.href='write.do'">신규등록</button>
</body>
</html>
				
	</c:otherwise>
</c:choose>

