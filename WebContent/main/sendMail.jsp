<%@page import=" java.util.Properties"%>
<%@page import=" javax.mail.Message"%>
<%@page import=" javax.mail.MessagingException"%>
<%@page import=" javax.mail.PasswordAuthentication"%>
<%@page import=" javax.mail.Session"%>
<%@page import=" javax.mail.Transport"%>
<%@page import=" javax.mail.internet.AddressException"%>
<%@page import=" javax.mail.internet.InternetAddress"%>
<%@page import=" javax.mail.internet.MimeMessage"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%  // Controller 로부터 결과 데이터 받음.
	int cnt = (Integer)request.getAttribute("result");
	String mem_password = (String)request.getAttribute("mem_password");
	String mem_email = (String)request.getAttribute("mem_email");
    String str = "";
%>
<%
request.setCharacterEncoding("utf-8");
 
String user = "hd04mail@gmail.com"; 
String password = "!aA112233";  

//받는 사람
String to = mem_email; 
// SMTP 서버 정보를 설정한다.
Properties prop = new Properties();
prop.put("mail.smtp.host", "smtp.gmail.com"); 
prop.put("mail.smtp.port", 465); 
prop.put("mail.smtp.auth", "true"); 
prop.put("mail.smtp.ssl.enable", "true"); 
prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
%>
<%
Session session1 = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(user, password);
    }
});

try {
    MimeMessage message = new MimeMessage(session1);
    message.setFrom(new InternetAddress(user));

    //수신자메일주소
    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); 

    // Subject
    message.setSubject("해도북스에서 임시 비밀번호가 발급되었습니다."); //메일 제목을 입력

    // Text
    message.setText("임시 비밀번호는 "+mem_password+" 입니다. 로그인 후 비밀번호를 변경하세요.");    //메일 내용을 입력

    // send the message
    Transport.send(message); ////전송
    System.out.println("메일보냄! "+ mem_password);
} catch (AddressException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
} catch (MessagingException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
}

 

%>

