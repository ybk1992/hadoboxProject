<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    session.invalidate();%>
<script>
alert("로그아웃 성공. 메인으로 돌아갑니다");
location.href = "main.do";
</script>