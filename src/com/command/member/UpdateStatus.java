package com.command.member;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.write.Command;
import com.lec.beans.MemberDAO;
import com.lec.beans.MemberDTO;

public class UpdateStatus implements Command {
	

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    HttpSession session = request.getSession();

		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		String mem_userid = (String)session.getAttribute("mem_userid");


		if(mem_userid != null && mem_userid.trim().length() > 0) {
			try {
				cnt = dao.updateStatus(mem_userid);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	    session.invalidate();
	    
		request.setAttribute("result", cnt);

		System.out.println(cnt);
	}

}


