package com.command.member;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.write.Command;
import com.lec.beans.MemberDAO;
import com.lec.beans.MemberDTO;

public class UpdateInfoCommand implements Command {
	

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    HttpSession session = request.getSession();

		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		String mem_userid = (String)session.getAttribute("mem_userid");
		
		// 입력한 값(parameter) 받아오기
		String mem_password = request.getParameter("mem_password");
		String mem_phone = request.getParameter("mem_phone");
		String mem_email = request.getParameter("mem_email");
		String mem_zipcode = request.getParameter("mem_zipcode");
		String mem_address1 = request.getParameter("mem_address1");
		String mem_address2 = request.getParameter("mem_address2");
		String mem_image = request.getParameter("mem_image");


		if(mem_password != null && mem_password.trim().length() > 0) {
			try {
				cnt = dao.updateMyinfo(mem_password, mem_phone, mem_email, mem_zipcode, mem_address1, mem_address2, mem_image, mem_userid);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);

		System.out.println(cnt);
	}

}


