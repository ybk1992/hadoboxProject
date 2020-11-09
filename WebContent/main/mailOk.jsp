<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%  // Controller 로부터 결과 데이터 받음.
	int cnt = (Integer)request.getAttribute("result");

    String str = "";


%>

<% if(cnt == 1){
	str="NO";
	 out.print(str);
		
} else { 
	str="YES";
	 out.print(str);
	
} %>


