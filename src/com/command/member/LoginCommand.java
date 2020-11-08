package com.command.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.write.Command;
import com.lec.beans.MemberDAO;

public class LoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		
		// 입력한 값(parameter) 받아오기
		String mem_userid = request.getParameter("mem_userid");
		String mem_password = request.getParameter("mem_password");
	
		//세션
	    HttpSession session = request.getSession();
	    
		// 유효성 체크
		if(mem_userid != null && mem_password != null &&
				mem_userid.trim().length() > 0 && mem_password.trim().length() > 0) {
			try {
				cnt = dao.select(mem_userid, mem_password);

				//세션에 회원 정보 저장하기
				session.setAttribute("mem_userid", mem_userid);
				session.setAttribute("memLogin", true);
				
			} catch (Exception e) {
				e.printStackTrace();			}
		} // end if
			
		request.setAttribute("result", cnt);
	}

}















