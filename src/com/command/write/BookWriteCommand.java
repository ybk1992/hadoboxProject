package com.command.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.BookDAO;
import com.lec.beans.WriteDAO;

public class BookWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		BookDAO dao = new BookDAO();
		
		String sellid = request.getParameter("sellid");
		String name = request.getParameter("name");
		int price = Integer.parseInt(request.getParameter("price"));
		String content = request.getParameter("content");
		//String uri = request.getParameter("uri");
		int cate = Integer.parseInt(request.getParameter("cate"));
		String image = request.getParameter("image");
		System.out.println(cate);
		// 유효성 체크
		if(sellid != null && name != null && content != null && image != null &&
				 sellid.trim().length() > 0 && name.trim().length() > 0 && content.trim().length() > 0 && 
				 image.trim().length() > 0) {
			try {
				cnt = dao.insert(sellid, name, price, content, 0, "미정", cate, "0", image);
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} // end if
		
		
		request.setAttribute("result", cnt);
	}

}
















