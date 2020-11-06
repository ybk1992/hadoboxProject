<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    isELIgnored="false"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
    <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
        <ul class="navbar-nav mr-auto" style="font-size:20px;">
            <li class="nav-item active">
                <a class="nav-link" href="${contextPath}/main.do" >메인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/book_List.do">중고책장터</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">자유게시판</a>
            </li>
        </ul>
    </div>
    
    <div class="mx-auto order-0">
        <a class="navbar-brand mx-auto">HD BOOK [중고 책 거래 사이트]  </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
            <span class="navbar-toggler-icon"></span>
        </button>
    </div>
    
    <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
        <ul class="navbar-nav ml-auto" style="font-size:20px;">
        		   <c:choose>
		     <c:when test="${memLogin==true}">
		    <li class="nav-item">
                <a class="nav-link">${mem_userid}님 환영합니다^^</a>
            </li>
		    <li class="nav-item">
                <a class="nav-link" href="${contextPath}/logout.do">로그아웃</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/myPage.do">마이페이지</a>
            </li>

			 </c:when>
			 <c:otherwise>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/login.do">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${contextPath}/join.do">회원가입</a>
            </li>
			 </c:otherwise>
			</c:choose>
        </ul>
    </div>
</nav>