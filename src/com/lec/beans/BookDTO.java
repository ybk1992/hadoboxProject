package com.lec.beans;

public class BookDTO {
	private int book_num;		// 글번호
	private String book_sellid;	// 회원아이디
	private String book_name;	// 책이름
	private int book_price;		// 책가격
	private String book_regdate;// 작성한날짜
	private String book_content;// 글내용
	private int book_viewcnt;	// 조회수
	private String book_title;	// 글제목
	private int book_cate;		// 책카테고리
	
	private String book_cate_name; //카테고리 명
	private String book_cate_pre; //세부 카테고리 명
	
	private String book_image;	// 이미지경로
	private String book_status;	// 판매여부
	
	private int cate_num;		// 책카테고리
	
	private String cate_name; //카테고리 명
	private String cate_pre; //세부 카테고리 명
	
	
	public BookDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BookDTO(int cate_num, String cate_name, String cate_pre) {
		super();
		this.cate_num = cate_num;
		this.cate_name = cate_name;
		this.cate_pre = cate_pre;
		System.out.printf("BookDTO(%d, %s, %s) 객체 생성 ", 
				cate_num, cate_name, cate_pre);
	}
	
	public BookDTO(int book_num, String book_sellid, String book_name, int book_price, String book_regdate,
			String book_content, int book_viewcnt, String book_title, int book_cate, String book_cate_name, String book_cate_pre, String book_image, String book_status) {
		super();
		this.book_num = book_num;
		this.book_sellid = book_sellid;
		this.book_name = book_name;
		this.book_price = book_price;
		this.book_regdate = book_regdate;
		this.book_content = book_content;
		this.book_viewcnt = book_viewcnt;
		this.book_title = book_title;
		this.book_cate = book_cate;
		this.book_cate_name = book_cate_name;
		this.book_cate_pre = book_cate_pre;
		this.book_image = book_image;
		this.book_status = book_status;
		System.out.printf("\nBookDTO(%d, %s, %s, %d, %s, %s, %d, %s, %d, %s, %s, %s, %s) 객체 생성", 
				book_num, book_sellid, book_name, book_price, book_regdate, 
				book_content, book_viewcnt, book_title, book_cate, book_cate_name, book_cate_pre, book_image, book_status);
	}



	public int getBook_num() {
		return book_num;
	}

	public void setBook_num(int book_num) {
		this.book_num = book_num;
	}

	public String getBook_sellid() {
		return book_sellid;
	}

	public void setBook_sellid(String book_sellid) {
		this.book_sellid = book_sellid;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public int getBook_price() {
		return book_price;
	}

	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}

	public String getBook_regdate() {
		return book_regdate;
	}

	public void setBook_regdate(String book_regdate) {
		this.book_regdate = book_regdate;
	}

	public String getBook_content() {
		return book_content;
	}

	public void setBook_content(String book_content) {
		this.book_content = book_content;
	}

	public int getBook_viewcnt() {
		return book_viewcnt;
	}

	public void setBook_viewcnt(int book_viewcnt) {
		this.book_viewcnt = book_viewcnt;
	}

	public String getBook_title() {
		return book_title;
	}

	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}

	public int getBook_cate() {
		return book_cate;
	}

	public void setBook_cate(int book_cate) {
		this.book_cate = book_cate;
	}
	
	public String getBook_cate_name() {
		return book_cate_name;
	}
	
	public String getBook_cate_pre() {
		return book_cate_pre;
	}

	public String getBook_image() {
		return book_image;
	}

	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}

	public String getBook_status() {
		return book_status;
	}

	public void setBook_status(String book_status) {
		this.book_status = book_status;
	}


	@Override
	public String toString() {
		return String.format("BookDTO] %d : %s : %s : %d : %s : %s : %d : %s : %d : %s : %d", 
				book_num, book_sellid, book_name, book_price, book_regdate, 
				book_content, book_viewcnt, book_title, book_cate, book_image, book_status);
	}



	public int getCate_num() {
		return cate_num;
	}



	public void setCate_num(int cate) {
		this.cate_num = cate;
	}



	public String getCate_name() {
		return cate_name;
	}



	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}



	public String getCate_pre() {
		return cate_pre;
	}



	public void setCate_pre(String cate_pre) {
		this.cate_pre = cate_pre;
	}
	
	
}
