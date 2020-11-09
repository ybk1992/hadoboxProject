package com.command.book;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.write.Command;
import com.lec.beans.AnswerDAO;
import com.lec.beans.BookDAO;
import com.lec.beans.WriteDAO;

public class AnsDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		AnswerDAO dao = new AnswerDAO();
		
		int num = Integer.parseInt(request.getParameter("book_num").trim());
		HttpSession session = request.getSession();
		String loginID = (String)session.getAttribute("mem_userid");
		
		try {
			cnt = dao.deleteByAnswerNum(loginID, num);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
	}

}














