package common;

/*
 * DB접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * XML, 초기화 파라미터 등에서 관리하는 것이 좋다.
 */
public class D {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public static final String USERID = "hd04a";
	public static final String USERPW = "hd04b";
	
	// 게시글 관련 쿼리문
	public static final String SQL_WRITE_INSERT = 
			"INSERT INTO test_write"
			+ "(wr_uid, wr_subject, wr_content, wr_name, wr_regdate) "
			+ "VALUES"
			+ "(test_write_seq.nextval, ?, ?, ?, SYSDATE)";
	
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM test_write ORDER BY wr_uid DESC";
	
	public static final String SQL_WRITE_SELECT_BY_UID =
			"SELECT * FROM test_write WHERE wr_uid=?";
	
	public static final String SQL_WRITE_INC_VIEWCNT = 
			"UPDATE test_write SET wr_viewcnt = wr_viewcnt + 1 WHERE wr_uid = ?";
	
	public static final String SQL_WRITE_DELETE_BY_UID =
			"DELETE FROM test_write WHERE wr_uid = ?";

	public static final String SQL_WRITE_UPDATE =
			"UPDATE test_write SET wr_subject = ?, wr_content = ? WHERE wr_uid = ?";
	
	//insert 책 등록 <-- 글번호, 판매자, 책이름, 책가격, 작성일, 내용, 조회수, 책주소, 카테고리, 판매여부, 이미지경로
	public static final String SQL_BOOK_INSERT = 
			"INSERT INTO BOOKLIST (BOOK_NUM, BOOK_SELLID, BOOK_NAME, BOOK_PRICE, BOOK_REGDATE, " + 
			"BOOK_CONTENT, BOOK_VIEWCNT BOOK_URI, BOOK_CATE, BOOK_STATUS, BOOK_IMAGE)" + 
			" VALUES (HD04A_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, ?, ?, ?, ?, ?)";
	//select 전체 글
	public static final String SQL_BOOK_SELECT = 
			"SELECT * FROM  HD04A ORDER BY BOOK_NUM DESC";
	//select book_num 선택 글 읽기
	public static final String SQL_BOOK_SELECT_BY_NUM = 
			"SELECT * FROM HD04A WHERE BOOK_NUM=?";
	//update 글 수정 / 책이름, 책가격, 작성일, 내용, 책주소, 카테고리, 판매여부, 이미지경로
	public static final String SQL_BOOK_UPDATE = 
			"UPDATE HD04A SET BOOK_NAME = ?, BOOK_PRICE = ?, BOOK_REGDATE = ?, BOOK_CONTENT = ?, " + 
			"BOOK_URI = ?, BOOK_CATE = ?, BOOK_STATUS = ?, BOOK_IMAGE = ?";
	//delete 글 삭제
	public static final String SQL_BOOK_DELETE = 
			"DELETE FROM HD04A WHERE BOOK_NUM = ?";
	
	
} // end D










