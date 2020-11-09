package com.command.book;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.write.Command;
import com.lec.beans.AnswerDAO;
import com.lec.beans.BookDAO;

public class AnsWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		AnswerDAO dao = new AnswerDAO();
		int num = Integer.parseInt(request.getParameter("book_num").trim());
		String an_content = request.getParameter("an_content");
		
		HttpSession session = request.getSession();
		String loginID = (String)session.getAttribute("mem_userid");
		// 유효성 체크
		try {
			cnt = dao.insertAnswer(num, an_content, loginID);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
		System.out.println(cnt);
	}

}














