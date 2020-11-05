package com.command.book;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.command.write.Command;
import com.lec.beans.BookDAO;
import com.lec.beans.BookDTO;

public class BookListCommand implements Command  {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BookDAO dao = new BookDAO();  // DAO 객체 생성
		BookDTO [] arr = null;
		
		try {
			arr = dao.selectAllBook();  // 트랜잭션 수행
			
			// "book_List" 란  name 으로 request 에 arr 을 저장
			// request 가 컨트롤러에 전달될것이다.
			request.setAttribute("book_List", arr);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
