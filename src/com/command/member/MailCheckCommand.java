package com.command.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.MemberDAO;

public class MailCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		
		
		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		// 입력한 값(parameter) 받아오기
		String mem_email = request.getParameter("mem_email");

		System.out.println(mem_email);
		// 유효성 체크
		if(mem_email != null && mem_email.trim().length() > 0) {
			try {
				cnt = dao.chkMail(mem_email);	
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("result", cnt);
		

	}

}


