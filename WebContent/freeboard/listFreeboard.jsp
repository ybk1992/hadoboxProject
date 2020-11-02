<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>  <%-- JDBC 관련 클래스 import --%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import="com.lec.beans.*" %>
<%@ page import="common.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="dao" class="com.lec.beans.WriteDAO"/>  <%-- DAO bean 생성 --%>

<% // dao 를 사용한 트랜잭션
	WriteDTO arr [] = dao.select();
%>

<%
	int curPage = 1; // 현재 페이지 (디폴트는 1 page)
	
	// 현재 몇 페이지 인지 parameter 받아오기
	String pageParam = request.getParameter("page");
	if(pageParam != null && !pageParam.trim().equals("")){
		try{			
			curPage = Integer.parseInt(pageParam);
		} catch(NumberFormatException e){
			// ※ page parameter 에러 처리
		}
	}

%>


<%!
	// JDBC 관련 기본 객체 변수들 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;  // executeQuery(), SELECT 결과 
	int cnt = 0;  // executeUpdate(), DML 결과
	
	
  
%>

<%!

	
	// 페이징 관련 세팅 값들
	// cnt <- 글 목록 전체 개수
	int writePages = 10;  // 한 [페이징] 에 몇개의 '페이지' 를 표현할 것인가?
	int pageRows = 5;   // 한 '페이지' 에 몇개의 글을 리스트 할 것인가?
	int totalPage = 0;   // 총 몇 '페이지' 분량인가?
%>

<%
	try{
		Class.forName(D.DRIVER);
		conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
		
		pstmt = conn.prepareStatement(D.SQL_COUNT_ALL);		
		rs = pstmt.executeQuery();
		
		if(rs.next())
			cnt = rs.getInt(1);  // 전체 개수 구하기
			
		rs.close();
		pstmt.close();
		
		totalPage = (int)Math.ceil(cnt / (double)pageRows);  // 총 몇 페이지 분량인가?
				
		int fromRow = (curPage - 1) * pageRows + 1;   // 몇번째  row 부터?
				
		pstmt = conn.prepareStatement(D.SQL_SELECT_FROM_ROW);
		pstmt.setInt(1, fromRow);   // 몇번째 row 부터  몇개 (pageRows)
		pstmt.setInt(2, fromRow + pageRows);   
		rs = pstmt.executeQuery();
		
%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>글 목록 <%= curPage %>페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<style>
table {width: 500px;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<!-- 페이징 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="../CSS/listFreeboard.css"/>
<script src="https://kit.fontawesome.com/bb29575d31.js"></script>


</head>
<body>

		
<div class = "serch">	
		<h2>자유게시판</h2>
		<select id = "what">
			<option value = "title">제목</option>
			<option value = "who">작성자</option>
		</select>
		<input type="text" id="serchText">
		<button id="serchFinal">검색</button>
</div>
<div class = "box">	
<h4>총 <%= cnt %>개</h4> <!-- 전체 글 개수 -->
		<table>
			<tr>

				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				
			</tr>
<%
	while(rs.next()){
		out.print("<tr>");
		int rnum = rs.getInt("rnum");  // rownum 을 가져온다
		
		int uid = rs.getInt("wr_uid");
		String subject = rs.getString("wr_subject");
		String name = rs.getString("wr_name");
		int viewcnt = rs.getInt("wr_viewcnt");
		Date d = rs.getDate("wr_regdate");  // 날짜만 가져옴...
		Time t = rs.getTime("wr_regdate");
		String regdate = "";
		if(d != null){
			regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " " 
						+ new SimpleDateFormat("hh:mm:ss").format(t);			
		}
		
		
		out.println("<td>" + uid + "</td>");
		out.println("<td><a href='view.jsp?uid=" + uid + "&page=" + curPage + "'>" + subject + "</a></td>");
		out.println("<td>" + name + "</td>");		
		out.print("</tr>");
	}
%>		
		</table>

		<br>
		<button onclick="location.href = 'write.jsp'">신규등록</button>
		</div>


<%	
	} catch(Exception e){
		e.printStackTrace();
		//※ 예외처리를 하든지, 예외 페이지를 설정해주어야 한다.
	} finally {
		// DB리소스 해제
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e){
			e.printStackTrace();	
		}		
	}

%>

<div class = "paging">
<%-- 페이징 --%>
<jsp:include page="pagination.jsp">
	<jsp:param value="<%= writePages %>" name="writePages"/>
	<jsp:param value="<%= totalPage %>" name="totalPage"/>
	<jsp:param value="<%= curPage %>" name="curPage"/>	
</jsp:include>
</div>

 <footer class="py-5 bg-dark">
    <div class="container">

      <p class="m-0 text-center text-white">
        <img src="../image/logo-white.png" alt="logo" id="footer_logo">
        Copyright &copy; 2020. (주)해도북스 컴퍼니. All right reserved.</p>
    </div>
    <!-- /.container -->
  </footer>


</body>
</html>
















