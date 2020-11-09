package com.command.member;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.write.Command;
import com.lec.beans.MemberDAO;
import com.lec.beans.MemberDTO;

public class UpdateMyInfoCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	    HttpSession session = request.getSession();

		
		MemberDAO dao = new MemberDAO();  // DAO 객체 생성
		MemberDTO [] arr = null;
		String mem_userid = (String)session.getAttribute("mem_userid");

		try {
			arr = dao.selectMyInfo(mem_userid) ;  // 트랜잭션 수행
			
			// "MyInfo" 란  name 으로 request 에 arr을 저장
			// request 가 컨트롤러에 전달될것이다.
			request.setAttribute("MyInfo", arr);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}


