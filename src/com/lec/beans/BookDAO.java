package com.lec.beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.D;

public class BookDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection도 생성된다.
	public BookDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("BookDAO생성, 데이터베이스 연결!!");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}// end 생성자
	
	
	// DB 자원 반납 메소드, 만들어 놓으면 편함.
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close()
	
	// insertBook 책 등록 <-- 작성자, 책이름, 책가격, 책내용, 책이미지, 책카테고리, 판매여부, 글 주소(?)
	public int insert(String sellid, String name, int price, 
			String content, int viewcnt, String title, int cate, 
			String status, String image ) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_BOOK_INSERT);
			pstmt.setString(1, sellid);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setString(4, content);
			pstmt.setInt(5, viewcnt);
			pstmt.setString(6, title);
			pstmt.setInt(7, cate);
			pstmt.setString(8, status);
			pstmt.setString(9, image);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	} // end insert();
	
	
	// 새글작성 <-- DTO
		public int insert(BookDTO dto) throws SQLException{
			String sellid = dto.getBook_sellid();
			String name = dto.getBook_name();
			int price = dto.getBook_price();
			String content = dto.getBook_content();
			int viewcnt = dto.getBook_viewcnt();
			String title = dto.getBook_title();
			int cate = dto.getBook_cate();
			String status = dto.getBook_status();
			String image = dto.getBook_image();
			
			int cnt = this.insert(sellid, name, price, content, 
					viewcnt, title, cate, status, image);
			return cnt;		
		}
		
		public BookDTO [] createArrCate(ResultSet rs) throws SQLException {
			BookDTO [] arr = null;  // DTO 배열로 리턴
			ArrayList<BookDTO> list = new ArrayList<BookDTO>();
			
			while(rs.next()) {
				int num = rs.getInt("cate_num");
				String name = rs.getString("cate_name");
				String pre = rs.getString("cate_pre");
				BookDTO dto = new BookDTO(num, name, pre);
				list.add(dto);
			}
			
			arr = new BookDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
			list.toArray(arr);  // 리스트 -> 배열
			return arr;
			
		}
	
	
	// createArray <-- ResultSet --> DTO 배열로 리턴
	public BookDTO [] createArray(ResultSet rs) throws SQLException {
		BookDTO [] arr = null;  // DTO 배열로 리턴
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();
		
		while(rs.next()) {
			int num = rs.getInt("book_num");
			String sellid = rs.getString("book_sellid");
			String name = rs.getString("book_name");
			int price = rs.getInt("book_price");
			String content = rs.getString("book_content");
			int viewcnt = rs.getInt("book_viewcnt");
			String title = rs.getString("book_title");
			int cate = rs.getInt("book_cate");
			String cate_name = rs.getString("cate_name");
			String cate_pre = rs.getString("cate_pre");
			String status = rs.getString("book_status");
			String image = rs.getString("book_image");
			Date d = rs.getDate("book_regdate");
			Time t = rs.getTime("book_regdate");
			String regdate = "";
			if(content == null) content = "";
			if(d != null) {
				regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
		
			
			BookDTO dto = new BookDTO(num, sellid, name, price, regdate, content, 
					viewcnt, title, cate, cate_name, cate_pre, image, status);
			dto.setBook_regdate(regdate);
			list.add(dto);
		} // end while
		
		arr = new BookDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
		list.toArray(arr);  // 리스트 -> 배열
			
		return arr;
		
	} // end createArray()
	
	// createArray <-- ResultSet --> DTO 배열로 리턴
		public BookDTO [] createArrayDesc(ResultSet rs) throws SQLException {
			BookDTO [] arr = null;  // DTO 배열로 리턴
			ArrayList<BookDTO> list = new ArrayList<BookDTO>();
			
			while(rs.next()) {
				int num = rs.getInt("book_num");
				String sellid = rs.getString("book_sellid");
				String name = rs.getString("book_name");
				int price = rs.getInt("book_price");
				String content = rs.getString("book_content");
				int viewcnt = rs.getInt("book_viewcnt");
				String title = rs.getString("book_title");
				int cate = rs.getInt("book_cate");
				String status = rs.getString("book_status");
				String image = rs.getString("book_image");
				Date d = rs.getDate("book_regdate");
				Time t = rs.getTime("book_regdate");
				String regdate = "";
				if(content == null) content = "";
				if(d != null) {
					regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
							+ new SimpleDateFormat("hh:mm:ss").format(t);
				}
				
			
				
				BookDTO dto = new BookDTO(num, sellid, name, price, regdate, content, 
						viewcnt, title, cate, "", "", image, status);
				dto.setBook_regdate(regdate);
				list.add(dto);
			} // end while
			
			arr = new BookDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
			list.toArray(arr);  // 리스트 -> 배열
				
			return arr;
			
		} // end createArray()
	
	//selectAllCategory
	public BookDTO [] selectAllCategory() throws SQLException {
		BookDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_BOOK_CATEGORY_SELECT);
			rs = pstmt.executeQuery();
			arr = createArrCate(rs);
		} finally {
			close();
		}
		return arr;
	} // end selectAllCategory()
	
	// searchBook <-- 내용 검색
		public BookDTO [] searchBook(String sessSearch) throws SQLException {
			BookDTO [] arr = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_BOOK_SEARCH);
				pstmt.setString(1, "%"+sessSearch+"%");
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			}
			
			return arr;
		} // end select()
	
	// selectAllBook <-- 전체 읽기
	public BookDTO [] selectAllBook() throws SQLException {
		BookDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_BOOK_SELECT);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		 
		return arr;
	} // end select()
	
	// selectAllBookDesc <-- 전체 내림차순 읽기
		public BookDTO [] selectAllBookDesc() throws SQLException {
			BookDTO [] arr = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_BOOK_SELECT_DESC);
				rs = pstmt.executeQuery();
				arr = createArrayDesc(rs);
			} finally {
				close();
			}
			 
			return arr;
		} // end select()
	
		//SQL_BOOK_CATE_PRE_SELECT
		public BookDTO [] selectCatepre(String sessCatePre) throws SQLException {
			BookDTO [] arr = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_BOOK_CATE_PRE_SELECT);
				pstmt.setString(1, sessCatePre);
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			}
			 
			return arr;
		} // end select()
	
	// 특정 uid 의 글만 SELECT
		public BookDTO[] selectByBookNum(int num) throws SQLException {
			BookDTO [] arr = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_BOOK_SELECT_BY_NUM);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			} // end try
			
			return arr;
		} // end selectByUid()	
	
	// selectByBookNum <-- 판매글 읽기 + 조회수 증가
	public BookDTO[] readByBookNum(int num) throws SQLException {
		
		BookDTO [] arr = null;
		
		try {
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(D.SQL_BOOK_INC_VIEWCNT);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = conn.prepareStatement(D.SQL_BOOK_SELECT_BY_NUM);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			conn.commit();
		} catch(SQLException e) {
			conn.rollback();  // 예외 발생하면 rollback
			throw e;		  // 예외를 다시 throw
		} finally {
			close();
		} // end try
		
		return arr;
	} // end readByBookNum()
	
	
	// updateBook 등록 글 수정 <-- 책이름, 책가격, 책내용, 책이미지, 책카테고리, 판매여부
	public int updateBook(int num, String name, String price, String content, String image, int cate, String status) throws SQLException{
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_BOOK_UPDATE);
			pstmt.setString(1, name);
			pstmt.setString(2, price);
			pstmt.setString(3, content);
			pstmt.setString(4, image);
			pstmt.setInt(5, cate);
			pstmt.setString(6, name);
			pstmt.setString(7, status);
			pstmt.setInt(8, num);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		} // end try		
		
		return cnt;
	} // end update()
	
	
	// deleteByBookNum <-- 판매글 삭제
	// 특정 uid 글 삭제하기
		public int deleteByBookNum(int num) throws SQLException {
			int cnt = 0;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_BOOK_DELETE);
				pstmt.setInt(1, num);
				cnt = pstmt.executeUpdate();			
			} finally {
				close();
			}
			
			return cnt;
		} // end deleteByUid()
	
	
	
}







