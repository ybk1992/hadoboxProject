package com.command.book;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.BookDAO;

public class BookWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		BookDAO dao = new BookDAO();
		
		// 입력한 값(parameter) 받아오기
		String sellid = request.getParameter("book_sellid");
		String name = request.getParameter("book_name");
		int price = Integer.parseInt(request.getParameter("book_price"));
		String content = request.getParameter("book_content");
		int viewcnt = Integer.parseInt(request.getParameter(""));
		String uri = request.getParameter("book_uri");
		int cate = Integer.parseInt(request.getParameter("book_cate"));
		String status = request.getParameter("book_status");
		String image = request.getParameter("book_image");
		
		
		
		// 유효성 체크
		if(sellid != null && name != null && price != 0 && content != null && 
				viewcnt != 0 && uri != null && cate != 0 && status != null && image != null) {
			try {
				cnt = dao.insert(sellid, name, price, content, viewcnt, 
						uri, cate, status, image);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} // end if
		
		
		request.setAttribute("result", cnt);
	}

}
















