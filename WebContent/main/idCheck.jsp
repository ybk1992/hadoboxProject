<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="selectController" class="sogom.mgmt.libs.controller.SelectController"></jsp:useBean>
<%
    request.setCharacterEncoding("UTF-8");
 
    String user_number = request.getParameter("user_number");
    boolean flag = true;
    String str = "";
    if(user_number == null){
        user_number = "";
    }
    
    if(!user_number.equals("")){
        flag = selectController.idCheck(user_number);
    }
    if(flag){    // 이미 존재하는 계정
        str = "NO";
        out.print(str);
    
    }else{        // 사용가능한 계정
        str = "YES";
        out.print(str);
    }
%>
