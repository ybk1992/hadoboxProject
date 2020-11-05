package com.lec.beans;

import java.sql.Date;
import java.sql.SQLException;


// DTO : Data Transfer Object
public class MemberDTO {
	private int mem_num;    // mem_num
	private String mem_userid;  // mem_userid
	private String mem_email;  // mem_email
	private String mem_password;   // mem_password
	private String mem_username;   // mem_username
	private String mem_phone;   // mem_phone
	private String mem_zipcode;   // mem_zipcode
	private String mem_address1;   // mem_address1
	private String mem_address2;   // mem_address2
	private Date mem_register_datetime;   // mem_register_datetime
	private String mem_status;   // mem_status
	private String mem_image;   // mem_image
	// 웹개발시..
	// 가능한, 다음의 3가지 이름을 일치시켜 주는게 좋습니다.
	// DB필드명 = 클래스필드명 = form 의 name 명
	
	// 기본생성자
	public MemberDTO() {
		super();
//		System.out.println("MemberDTO() 객체 생성");
	}
	
	// 매개변수 받는 생성자
	public MemberDTO(int mem_num, String mem_userid, String mem_email, String mem_password, String mem_username,  
			String mem_phone,  String mem_zipcode,  String mem_address1, String mem_address2, Date mem_register_datetime, String mem_status, String mem_image) {
		super();
		this.mem_num = mem_num;
		this.mem_userid = mem_userid;
		this.mem_email = mem_email;
		this.mem_password = mem_password;
		this.mem_username = mem_username;
		this.mem_phone = mem_phone;
		this.mem_zipcode = mem_zipcode;
		this.mem_address1 = mem_address1;
		this.mem_address2 = mem_address2;
		this.mem_register_datetime = mem_register_datetime;
		this.mem_status = mem_status;
		this.mem_image = mem_image;
	}



	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_userid() {
		return mem_userid;
	}

	public void setMem_userid(String mem_userid) {
		this.mem_userid = mem_userid;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_password() {
		return mem_password;
	}

	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}

	public String getMem_username() {
		return mem_username;
	}

	public void setMem_username(String mem_username) {
		this.mem_username = mem_username;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_status() {
		return mem_status;
	}

	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}

	public String getMem_image() {
		return mem_image;
	}

	public void setMem_image(String mem_image) {
		this.mem_image = mem_image;
	}

	@Override
	public String toString() {
		return "MemberDTO [mem_num=" + mem_num + ", mem_userid=" + mem_userid + ", mem_email=" + mem_email
				+ ", mem_password=" + mem_password + ", mem_username=" + mem_username + ", mem_phone=" + mem_phone
				+ ", mem_zipcode=" + mem_zipcode + ", mem_address1=" + mem_address1 + ", mem_address2=" + mem_address2
				+ ", mem_register_datetime=" + mem_register_datetime + ", mem_status=" + mem_status + ", mem_image="
				+ mem_image + "]";
	}
	

	// 개발할때  Class 의   toString() 오버라이딩 해주면
	// 디버깅이나 테스트 하기 좋다.


		
} // end DTO


