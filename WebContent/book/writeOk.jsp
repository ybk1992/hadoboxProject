<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<%--
	${result}  ==> request.getAttrubute("result")
 --%>

<c:choose>
	<c:when test="${result == 0 }">
		<script>
			alert("등록실패 !!!");
			history.back();
		</script>
	</c:when>

	<c:otherwise>
		<script>
			alert("등록 성공, 리스트를 출력합니다");
			location.href = "book_List.do?list=all";
		</script>
	</c:otherwise>
</c:choose>





















    
    