package com.command.member;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.MemberDAO;

public class MailCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		
		
		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		// 입력한 값(parameter) 받아오기
		String mem_userid = request.getParameter("mem_userid");
		String mem_email = request.getParameter("mem_email");

		String mem_password = "";
		  for(int i = 0; i < 8; i++){
		   char lowerStr = (char)(Math.random() * 26 + 97);
		   if(i%2 == 0){
			   mem_password += (int)(Math.random() * 10);
		   }else{
			   mem_password += lowerStr;
		   }
		  }

		System.out.println(mem_userid);
		System.out.println(mem_password);
		
		// 유효성 체크
		if(mem_userid != null && mem_userid.trim().length() > 0) {
			try {
				cnt = dao.updatePassword(mem_password, mem_userid);	
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}

		
		request.setAttribute("mem_password", mem_password);
		request.setAttribute("mem_email", mem_email);
		request.setAttribute("result", cnt);
		

	}

}


