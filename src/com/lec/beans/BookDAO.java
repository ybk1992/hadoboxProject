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
			System.out.println("WriteDAO생성, 데이터베이스 연결!!");
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
	public int insert(String sellid, String name, int price, String regdate, 
			String content, int book_viewcnt, String book_uri, int book_cate, 
			String book_status, String book_image ) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_BOOK_INSERT);
			pstmt.setString(1, sellid);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setString(4, regdate);
			pstmt.setString(5, content);
			pstmt.setInt(6, book_viewcnt);
			pstmt.setString(7, book_uri);
			pstmt.setInt(8, book_cate);
			pstmt.setString(9, book_status);
			pstmt.setString(10, book_image);
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
			String regdate = dto.getBook_regdate();
			String content = dto.getBook_content();
			int viewcnt = dto.getBook_viewcnt();
			String uri = dto.getBook_uri();
			int cate = dto.getBook_cate();
			String status = dto.getBook_status();
			String image = dto.getBook_image();
			
			int cnt = this.insert(sellid, name, price, regdate,
					content, viewcnt, uri, cate, status, image);
			return cnt;		
		}
	
	
	// createArray <-- ResultSet --> DTO 배열로 리턴
	
	// selectAllBook <-- 전체 읽기
	
	// selectByBookNum <-- 판매글 읽기
	
	// updateBook 등록 글 수정 <-- 책이름, 책가격, 책내용, 책이미지, 책카테고리, 판매여부, 글 주소(?)
	
	// deleteByBookNum <-- 판매글 삭제
	
	
	
	
}









