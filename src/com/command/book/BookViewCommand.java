package com.command.book;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.BookDAO;
import com.lec.beans.BookDTO;

public class BookViewCommand implements Command{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BookDAO dao = new BookDAO();
		BookDTO [] arr = null;
		
		int num = Integer.parseInt(request.getParameter("book_num"));
		
		try {
			arr = dao.selectByBookNum(num);   // 읽기 + 조회수 증가	
			request.setAttribute("list", arr);
		} catch(SQLException e) {
			e.printStackTrace();
		}		

	}
}
