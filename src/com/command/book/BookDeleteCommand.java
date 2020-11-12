package com.command.book;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.BookDAO;

public class BookDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		BookDAO dao = new BookDAO();
		
		int book_num = Integer.parseInt(request.getParameter("book_num"));
		
		
		try {
			cnt = dao.deleteByBookNum(book_num);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", cnt);
	}

}














