package com.command.book;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.BookDAO;

public class BookUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		BookDAO dao = new BookDAO();
		
		// parameter
		
		String price = request.getParameter("price");
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		int gory = Integer.parseInt(request.getParameter("gory"));
		String status = request.getParameter("status");
		
		if(price != null && title != null && status != null &&
				price.trim().length() > 0 && title.trim().length() > 0 && status.trim().length() > 0) {
			try {
				cnt = dao.updateBook(price, content, title, gory, status);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", cnt);
	}

}














