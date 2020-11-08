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
	
//아이디 비밀번호 찾기!
	public int selectIdPw(String mem_username, String mem_email){
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(D.SQL_MEMBERS_SELECT_BY_MEM_EMAIL);
			pstmt.setString(1, mem_email);
			rs = pstmt.executeQuery();
			if (rs.next()) { //로그인
				if (mem_username.equals(rs.getString("mem_username")) && mem_email.equals(rs.getString("mem_email"))){
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

//메일 중복체크
public int chkMail(String mem_email){
	int cnt = 0;
	
	try {
		pstmt = conn.prepareStatement(D.SQL_MEMBERS_SELECT_BY_MEM_EMAIL_CHK);
		pstmt.setString(1, mem_email);
		cnt = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		System.out.println("login실패");
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return cnt;
}

// createArray <-- ResultSet --> DTO 배열로 리턴
public MemberDTO [] createArray(ResultSet rs) throws SQLException {
	MemberDTO [] arr = null;  // DTO 배열로 리턴
	ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	
	while(rs.next()) {
		int mem_num = rs.getInt("mem_num");
		String mem_userid = rs.getString("mem_userid");
		String mem_email = rs.getString("mem_email");
		String mem_password = rs.getString("mem_password");
		String mem_username = rs.getString("mem_username");
		String mem_phone = rs.getString("mem_phone");
		String mem_zipcode = rs.getString("mem_zipcode");
		String mem_address1 = rs.getString("mem_address1");
		String mem_address2 = rs.getString("mem_address2");
		Date mem_register_datetime = rs.getDate("mem_register_datetime");
		String mem_status = rs.getString("mem_status");
		String mem_image = rs.getString("mem_image");

		if(mem_phone == null) mem_phone = "";
		if(mem_zipcode == null) mem_zipcode = "";
		if(mem_address1 == null) mem_address1 = "";
		if(mem_address2 == null) mem_address2 = "";
		if(mem_image == null) mem_image = "";

		
		MemberDTO dto = new MemberDTO(mem_num, mem_userid, mem_email, mem_password, mem_username,  
				mem_phone, mem_zipcode, mem_address1, mem_address2, mem_register_datetime, mem_status, mem_image);
		
		list.add(dto);
	} // end while
	
	arr = new MemberDTO[list.size()];  // 리스트에 담긴 DTO 의 개수만큼의 배열 생성 
	list.toArray(arr);  // 리스트 -> 배열
		
	return arr;
	
} // end createArray()




// 특정 mem_userid 의 정보만 SELECT
public MemberDTO[] selectMyInfo(String mem_userid) throws SQLException {
	MemberDTO [] arr = null;
	
	try {
		pstmt = conn.prepareStatement(D.SQL_MEMBERS_SELECT_BY_MEM_USERID_CHK);
		pstmt.setString(1, mem_userid);
		rs = pstmt.executeQuery();
		arr = createArray(rs);
	} finally {
		close();
	} // end try
	
	return arr;
} // end selectMyInfo()

// 특정 mem_email 의 정보만 SELECT
public MemberDTO[] selectMyIdPw(String mem_email) throws SQLException {
	MemberDTO [] arr = null;
	
	try {
		pstmt = conn.prepareStatement(D.SQL_MEMBERS_SELECT_BY_MEM_EMAIL_CHK);
		pstmt.setString(1, mem_email);
		rs = pstmt.executeQuery();
		arr = createArray(rs);
	} finally {
		close();
	} // end try
	
	return arr;
} // end selectMyIdPw()



//내 정보 수정하기
public int updateMyinfo(String mem_password, String mem_phone, String mem_email, String mem_zipcode, String mem_address1, String mem_address2, String mem_image, String mem_userid) throws SQLException{
	int cnt = 0;
	
	try {
		pstmt = conn.prepareStatement(D.SQL_MEMBERS_UPDATE);
		pstmt.setString(1, mem_password);
		pstmt.setString(2, mem_phone);
		pstmt.setString(3, mem_email);
		pstmt.setString(4, mem_zipcode);
		pstmt.setString(5, mem_address1);
		pstmt.setString(6, mem_address2);
		pstmt.setString(7, mem_image);
		pstmt.setString(8, mem_userid);
		cnt = pstmt.executeUpdate();
	} finally {
		close();
	} // end try		
	
	return cnt;
} // end updateMyinfo()



public int updatePassword(String mem_password, String mem_userid) throws SQLException{
	int cnt = 0;
	
	try {
		pstmt = conn.prepareStatement(D.SQL_MEMBERS_UPDATE_PASSWORD);
		pstmt.setString(1, mem_password);
		pstmt.setString(2, mem_userid);

		cnt = pstmt.executeUpdate();
	} finally {
		close();
	} // end try		
	
	return cnt;
} // end updateMyinfo()

}


