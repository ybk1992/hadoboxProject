package com.command.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.write.Command;
import com.lec.beans.MemberDAO;
import com.lec.beans.MemberDTO;

public class FindIdPwCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		MemberDAO dao = new MemberDAO();  // DAO 객체 생성
		MemberDAO dao2 = new MemberDAO();  // DAO 객체 생성
		MemberDTO [] arr = null;
		
		// 입력한 값(parameter) 받아오기
		String mem_username = request.getParameter("mem_username");
		String mem_email = request.getParameter("mem_email");
		
		//select 아이디 비번 찾기
		//public static final String SQL_MEMBERS_SELECT_BY_MEM_EMAIL =
			//	"SELECT mem_username, mem_email, mem_userid, mem_password FROM MEMBERS WHERE mem_email= ?";
		
		
		// 유효성 체크
		if(mem_username != null && mem_email != null) {
			
			try {
				arr = dao.selectMyIdPw(mem_email) ;  // 트랜잭션 수행
				cnt = dao2.selectIdPw(mem_username, mem_email);
	

				
			} catch (Exception e) {
				e.printStackTrace();			}
		} // end if
			
		if(cnt == 1) {
		request.setAttribute("MyIdPw", arr);
		request.setAttribute("result", cnt);
		System.out.println("힝");
		}

	}

}















