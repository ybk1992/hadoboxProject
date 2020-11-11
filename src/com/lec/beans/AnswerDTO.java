
package com.lec.beans;

public class AnswerDTO {
	private int an_num;
	private int an_writenum;
	private String an_content;
	private String an_regdate;
	private String an_id;
	
	
	public AnswerDTO(int an_num, int an_writenum, String an_content, String an_regdate, String an_id) {
		super();
		this.an_num = an_num;
		this.an_writenum = an_writenum;
		this.an_content = an_content;
		this.an_regdate = an_regdate;
		this.an_id = an_id;
		System.out.printf("AnswerDTO(%d, %d, %s, %s, %s) 객체 생성 ", 
				an_num, an_writenum, an_content, an_regdate, an_id);
	}

		

	public int getAn_num() {
		return an_num;
	}

	public void setAn_num(int an_num) {
		this.an_num = an_num;
	}

	public int getAn_writenum() {
		return an_writenum;
	}

	public void setAn_writenum(int an_writenum) {
		this.an_writenum = an_writenum;
	}

	public String getAn_content() {
		return an_content;
	}

	public void setAn_content(String an_content) {
		this.an_content = an_content;
	}

	public String getAn_regdate() {
		return an_regdate;
	}

	public void setAn_regdate(String an_regdate) {
		this.an_regdate = an_regdate;
	}

	public String getAn_id() {
		return an_id;
	}

	public void setAn_id(String an_id) {
		this.an_id = an_id;
	}
	
}