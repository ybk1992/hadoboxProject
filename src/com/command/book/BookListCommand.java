package com.command.book;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.command.write.Command;
import com.lec.beans.BookDAO;
import com.lec.beans.BookDTO;

public class BookListCommand implements Command  {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BookDAO dao = new BookDAO();  // DAO 객체 생성
		BookDTO [] arr = null;
		BookDAO dao2 = new BookDAO();  // DAO 객체 생성
		BookDTO [] cate = null;
		BookDAO dao3 = new BookDAO();  // DAO 객체 생성
		BookDTO [] cate_pre = null;
		BookDAO dao4 = new BookDAO();  // DAO 객체 생성
		BookDTO [] searchBook = null;
		
		try {
			
			String cp = request.getParameter("cp");
			String mc = request.getParameter("mc");
			String search = request.getParameter("search");

			if(cp != null) {
				System.out.println("NULL아니지 "+cp);
				cate_pre = dao3.selectCatepre(cp);
				request.setAttribute("book_cate_pre", cate_pre);
			}
			if(search != null) {
				System.out.println("검색어 : [ "+search+" ]");
				searchBook = dao4.searchBook(search);
				request.setAttribute("search", searchBook);
			}
			
			arr = dao.selectAllBook();  // 트랜잭션 수행
			cate = dao2.selectAllCategory();
			
			request.setAttribute("book_List", arr);
			request.setAttribute("cate", cate);
//
//			session.removeAttribute("catepre");
//			System.out.println("세부카테 세션 삭제");
//			session.removeAttribute("search");
//			System.out.println("검색 세션 삭제");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
