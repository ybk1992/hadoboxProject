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

public class AnswerDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection도 생성된다.
	public AnswerDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("AnswerDAO생성, 데이터베이스 연결!!");
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
	
	//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	
	// createArray <-- ResultSet --> DTO 배열로 리턴
	public AnswerDTO [] createArrayAnswer(ResultSet rs) throws SQLException {
		AnswerDTO [] arr = null;  // DTO 배열로 리턴
		ArrayList<AnswerDTO> list = new ArrayList<AnswerDTO>();
		
		while(rs.next()) {
			int an_num = rs.getInt("an_num");
			int an_writenum = rs.getInt("an_writenum");
			String an_content = rs.getString("an_content");
			Date d = rs.getDate("an_regdate");
			Time t = rs.getTime("an_regdate");
			String an_regdate = "";
			String an_id = rs.getString("an_id");
			
			if(an_content == null) an_content = "";
			if(d != null) {
				an_regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
						+ new SimpleDateFormat("hh:mm:ss").format(t);
			}
			
			AnswerDTO dto = new AnswerDTO(an_num, an_writenum, an_content, an_regdate, an_id);
			dto.setAn_regdate(an_regdate);
			list.add(dto);
		} // end while
		
		arr = new AnswerDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
		list.toArray(arr);  // 리스트 -> 배열
			
		return arr;
		
	} // end createArray()
		
	
	// 새글작성 <-- DTO
	public int insertAnswer(AnswerDTO dto) throws SQLException{
		
		int an_writenum = dto.getAn_writenum();
		String an_content = dto.getAn_content();
		String an_id = dto.getAn_id();
		
		int cnt = this.insertAnswer(an_writenum, an_content, an_id);
		return cnt;		
	}	
	
	// insertAnswer 댓글 등록 <-- 댓글 입력번호, 책이름, 책가격, 책내용, 책이미지, 책카테고리, 판매여부, 글 주소(?)
	public int insertAnswer(int an_writenum, String an_content, String an_id ) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_ANSWER_WRITE);
			pstmt.setInt(1, an_writenum);
			pstmt.setString(2, an_content);
			pstmt.setString(3, an_id);
			
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	} // end insertAnswer()
		
	//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
	
	// deleteByAnswerNum <-- 판매글 삭제
	// 특정 num 댓글 삭제하기
	public int deleteByAnswerNum(String an_id, int an_writenum) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_ANSWER_DELETE);
			pstmt.setString(1, an_id);
			pstmt.setInt(2, an_writenum);
			cnt = pstmt.executeUpdate();			
		} finally {
			close();
		}
		
		return cnt;
	} // end deleteByAnswerNum()
	
	
	// selectAnswer <-- 전체 읽기
	public AnswerDTO [] selectAnswer(int an_writenum) throws SQLException {
		AnswerDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_ANSWER_SELECT);
			pstmt.setInt(1, an_writenum);
			rs = pstmt.executeQuery();
			
			arr = createArrayAnswer(rs);
		} finally {
			close();
		}
		 
		return arr;
	} // end select()
	
	
}
