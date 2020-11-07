package com.command.member;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.MemberDAO;

public class FindPwCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		
		// 입력한 값(parameter) 받아오기
		String mem_userid = request.getParameter("mem_userid");
		String mem_password = request.getParameter("mem_password");
		String mem_username = request.getParameter("mem_username");
		String mem_phone = request.getParameter("mem_phone");
		String mem_email = request.getParameter("mem_email");
		String mem_zipcode = request.getParameter("mem_zipcode");
		String mem_address1 = request.getParameter("mem_address1");
		String mem_address2 = request.getParameter("mem_address2");
		String mem_image = request.getParameter("mem_image");

		// 유효성 체크
		if(mem_userid != null && mem_password != null && mem_username != null && mem_email != null &&
				mem_userid.trim().length() > 0 && mem_password.trim().length() > 0 && mem_username.trim().length() > 0 && mem_email.trim().length() > 0) {
			try {
				cnt = dao.insert(mem_userid, mem_email, mem_password, mem_username, mem_phone, mem_zipcode, mem_address1, mem_address2, mem_image);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} // end if
		
		
		request.setAttribute("result", cnt);
	}

}


