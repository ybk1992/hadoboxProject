<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%  // Controller 로부터 결과 데이터 받음.
	int cnt = (Integer)request.getAttribute("result");
%>

<% if(cnt == 0){ %>
	<script>
		alert("로그인실패 !!!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("로그인 성공! 환영합니다");
		location.href = "main.do";
	</script>
<% } %>


