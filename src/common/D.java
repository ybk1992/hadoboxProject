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

	// 회원 관련 쿼리문
	//회원가입
	public static final String SQL_MEMBERS_INSERT = 
			"INSERT INTO MEMBERS"
			+ "(mem_num, mem_userid, mem_email, mem_password, mem_username, mem_phone, mem_zipcode, mem_address1, mem_address2, mem_register_datetime, mem_status, mem_image)"
			+ "VALUES"
			+ "(MEMBERS_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, 1, ?)";

	//select 로그인
	public static final String SQL_MEMBERS_SELECT_BY_MEM_USERID =
			"SELECT mem_userid, mem_password, mem_status FROM MEMBERS WHERE mem_userid= ?";
	
	//select 아이디 중복 체크
	public static final String SQL_MEMBERS_SELECT_BY_MEM_USERID_CHK =
			"SELECT * FROM MEMBERS WHERE mem_userid= ?";
	

	
	// 게시글 관련 쿼리문
	public static final String SQL_COUNT_ALL = "SELECT COUNT(*) FROM test_write"; 

	// 쿼리: '몇번째(fromRow)' 부터 '몇개(pageRows)' 의 글 select
	public static final String SQL_SELECT_FROM_ROW = "SELECT * FROM " +
			"(SELECT ROWNUM AS RNUM, T.* FROM " +
			"	(SELECT * FROM test_write ORDER BY wr_uid DESC) T) " +
			"WHERE RNUM >= ? AND RNUM < ?"
			;
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
			"BOOK_CONTENT, BOOK_VIEWCNT, BOOK_TITLE, BOOK_CATE, BOOK_STATUS, BOOK_IMAGE)" + 
			" VALUES (BOOKLIST_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, ?, ?, ?, ?, ?, ?)";
	
	// 모든 카테고리 불러오기
	public static final String SQL_BOOK_CATEGORY_SELECT = 
			"SELECT * FROM CATEGORY";

	public static final String SQL_BOOK_CATE_PRE_SELECT = 
			"SELECT C.CATE_NAME, C.CATE_PRE, B.* " + 
					"FROM CATEGORY C, BOOKLIST B " + 
					"WHERE C.CATE_NUM = B.BOOK_CATE AND C.CATE_PRE = ? ORDER BY BOOK_REGDATE DESC";
	
	
	//select category 특정 num 카테고리 정보
	public static final String SQL_BOOK_CATEGORY_SELECT_BY_NUM = 
			"SELECT * FROM CATEGORY WHERE CATE_NUM=?";
	
	//search 내용 검색
	public static final String SQL_BOOK_SEARCH = 
			"SELECT C.CATE_NAME, C.CATE_PRE, B.* " + 
					"FROM CATEGORY C, BOOKLIST B " + 
					"WHERE C.CATE_NUM = B.BOOK_CATE AND B.BOOK_TITLE LIKE ? ORDER BY BOOK_REGDATE DESC";
	
	//select 전체 글
	public static final String SQL_BOOK_SELECT = 
			"SELECT C.CATE_NAME, C.CATE_PRE, B.* " + 
					"FROM CATEGORY C, BOOKLIST B " + 
					"WHERE C.CATE_NUM = B.BOOK_CATE ORDER BY BOOK_REGDATE DESC";

	//update book_viewcnt 선택 글 읽기+조회수 증가
	public static final String SQL_BOOK_INC_VIEWCNT = 
			"UPDATE BOOKLIST SET BOOK_VIEWCNT = BOOK_VIEWCNT + 1 WHERE BOOK_NUM = ?";
	
	//select book_num 특정 글 가져오기
	public static final String SQL_BOOK_SELECT_BY_NUM = 
			"SELECT C.CATE_NAME, C.CATE_PRE, B.* " + 
					"FROM CATEGORY C, BOOKLIST B " + 
					"WHERE C.CATE_NUM = B.BOOK_CATE AND BOOK_NUM=?";
	
	//update 글 수정 / 책이름, 책가격, 작성일, 내용, 책주소, 카테고리, 판매여부, 이미지경로
	public static final String SQL_BOOK_UPDATE = 
			"UPDATE BOOKLIST SET BOOK_NAME = ?, BOOK_PRICE = ?, BOOK_REGDATE = ?, BOOK_CONTENT = ?, " + 
			"BOOK_TITLE = ?, BOOK_CATE = ?, BOOK_STATUS = ?, BOOK_IMAGE = ?";
	//delete 글 삭제
	public static final String SQL_BOOK_DELETE = 
			"DELETE FROM BOOKLIST WHERE BOOK_NUM = ?";
	
	
} // end D










