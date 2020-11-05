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

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
		
	// DAO 객체가 생성될때 Connection도 생성된다.
	public MemberDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("MemberDAO생성, 데이터베이스 연결!!");
		} catch(Exception e) {
			e.printStackTrace();
		}
	} // end 생성자
	
	
	// DB 자원 반납 메소드, 만들어 놓으면 편함.
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	} // end close()
	

	// 회원가입 insert
	public int insert(String mem_userid, String mem_email, String mem_password, String mem_username, String mem_phone, String mem_zipcode, String mem_address1, String mem_address2, String mem_image) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(D.SQL_MEMBERS_INSERT);
			pstmt.setString(1, mem_userid);
			pstmt.setString(2, mem_email);
			pstmt.setString(3, mem_password);
			pstmt.setString(4, mem_username);
			pstmt.setString(5, mem_phone);
			pstmt.setString(6, mem_zipcode);
			pstmt.setString(7, mem_address1);
			pstmt.setString(8, mem_address2);
			pstmt.setString(9, mem_image);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	} // end insert();
	
//로그인
	public int select(String mem_userid, String mem_password){
	    int cnt = 0;
      
	      try {
	         pstmt = conn.prepareStatement(D.SQL_MEMBERS_SELECT_BY_MEM_USERID);
	         pstmt.setString(1, mem_userid);
	         rs = pstmt.executeQuery();
	         if (rs.next()) { //로그인
	            if (mem_password.equals(rs.getString("mem_password")) && rs.getString("mem_status").equals("1")){
	               cnt = 1;
	            } else {
	               System.out.println("비번틀림");
	            }
	            System.out.println(cnt);
	         }
	      } catch (SQLException e) {
	         System.out.println("login실패");
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return cnt;
	   }	


//아이디 중복체크
public int chkId(String mem_userid){
	int cnt = 0;
	
	try {
		pstmt = conn.prepareStatement(D.SQL_MEMBERS_SELECT_BY_MEM_USERID_CHK);
		pstmt.setString(1, mem_userid);
		cnt = pstmt.executeUpdate();

	} catch (SQLException e) {
		System.out.println("login실패");
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return cnt;
}	
}


