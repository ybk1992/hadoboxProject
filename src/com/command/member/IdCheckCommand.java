package com.command.member;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.MemberDAO;

public class IdCheckCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		
		
		int cnt = 0;
		MemberDAO dao = new MemberDAO();
		// 입력한 값(parameter) 받아오기
		String inputid = request.getParameter("mem_userid");

		System.out.println(inputid);
		// 유효성 체크
		if(inputid != null && inputid.trim().length() > 0) {
			try {
				cnt = dao.chkId(inputid);	
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(inputid.contains(" ")||inputid.trim().length() == 0) {
			try {
				cnt = -1;
				
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//cnt 가 0일때만 YES

		request.setAttribute("result", cnt);
		

	}

}


