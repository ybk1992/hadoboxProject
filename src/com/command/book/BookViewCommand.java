package com.command.book;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.AnswerDAO;
import com.lec.beans.AnswerDTO;
import com.lec.beans.BookDAO;
import com.lec.beans.BookDTO;

public class BookViewCommand implements Command{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BookDAO dao = new BookDAO();
		BookDTO [] arr = null;
		AnswerDAO an_dao = new AnswerDAO();
		AnswerDTO [] an_arr = null;
		
		int num = Integer.parseInt(request.getParameter("book_num").trim());
		
		try {
			arr = dao.readByBookNum(num);   // 읽기 + 조회수 증가	
			request.setAttribute("book_List", arr);
			
			an_arr = an_dao.selectAnswer(num);
			request.setAttribute("ansSelect", an_arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}		

	}
}
