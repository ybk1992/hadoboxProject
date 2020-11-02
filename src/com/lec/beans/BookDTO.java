package com.lec.beans;

public class BookDTO {
	private int book_num;		// 글번호
	private String book_sellid;	// 회원아이디
	private String book_name;	// 책이름
	private int book_price;		// 책가격
	private String book_regdate;// 작성한날짜
	private String book_content;// 글내용
	private int book_viewcnt;	// 조회수
	private String book_uri;	// 글주소
	private int book_cate;		// 책카테고리
	private String book_image;	// 이미지경로
	private int book_status;	// 판매여부
	
	public BookDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public BookDTO(int book_num, String book_sellid, String book_name, int book_price, String book_regdate,
			String book_content, int book_viewcnt, String book_uri, int book_cate, String book_image, int book_status) {
		super();
		this.book_num = book_num;
		this.book_sellid = book_sellid;
		this.book_name = book_name;
		this.book_price = book_price;
		this.book_regdate = book_regdate;
		this.book_content = book_content;
		this.book_viewcnt = book_viewcnt;
		this.book_uri = book_uri;
		this.book_cate = book_cate;
		this.book_image = book_image;
		this.book_status = book_status;
		System.out.printf("BookDTO(%d, %s, %s, %d, %s, %s, %d, %s, %d, %s, %d) 객체 생성", 
				book_num, book_sellid, book_name, book_price, book_cate, book_status);
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

	public String getBook_uri() {
		return book_uri;
	}

	public void setBook_uri(String book_uri) {
		this.book_uri = book_uri;
	}

	public int getBook_cate() {
		return book_cate;
	}

	public void setBook_cate(int book_cate) {
		this.book_cate = book_cate;
	}

	public String getBook_image() {
		return book_image;
	}

	public void setBook_image(String book_image) {
		this.book_image = book_image;
	}

	public int getBook_status() {
		return book_status;
	}

	public void setBook_status(int book_status) {
		this.book_status = book_status;
	}


	@Override
	public String toString() {
		return String.format("BookDTO] %d : %s : %s : %d : %s : %s : %d : %s : %d : %s : %d", 
				book_num, book_sellid, book_name, book_price, book_regdate, book_content,
				book_viewcnt, book_uri, book_cate, book_image, book_status);
	}
	
	
}
