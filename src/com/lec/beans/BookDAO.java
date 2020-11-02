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
	
	// insertBook <-- DTO
	
	// createArray <-- ResultSet --> DTO 배열로 리턴
	
	// selectAllBook <-- 전체 읽기
	
	// selectByBookNum <-- 판매글 읽기
	
	// updateBook 등록 글 수정 <-- 책이름, 책가격, 책내용, 책이미지, 책카테고리, 판매여부, 글 주소(?)
	
	// deleteByBookNum <-- 판매글 삭제
	
	
	
	
}









