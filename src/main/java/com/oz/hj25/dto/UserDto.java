package com.oz.hj25.dto;

public class UserDto {
	private int u_no;
	private String i_id;
	private String u_name;
	private String u_id;
	private String u_pw;
	private String u_addr;
	private String u_phone;
	private String u_grade;
	private String u_enabled;
	private String u_email;
	private int total;

	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public UserDto(int u_no, String i_id, String u_name, String u_id, String u_pw, String u_addr, String u_phone,
			String u_grade, String u_enabled, String u_email, int total) {
		super();
		this.u_no = u_no;
		this.i_id = i_id;
		this.u_name = u_name;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_addr = u_addr;
		this.u_phone = u_phone;
		this.u_grade = u_grade;
		this.u_enabled = u_enabled;
		this.u_email = u_email;
		this.total = total;
	}


	public UserDto(String u_id, String u_name, String u_email) {
		super();
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_email = u_email;
	}

	public UserDto(int u_no, String u_pw, String u_addr, String u_phone, String u_email) {
		super();
		this.u_no = u_no;
		this.u_pw = u_pw;
		this.u_addr = u_addr;
		this.u_phone = u_phone;
		this.u_email = u_email;
	}

	public UserDto(String i_id, String u_name, String u_id, String u_pw, String u_addr, String u_phone,
			String u_email) {
		super();
		this.i_id = i_id;
		this.u_name = u_name;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_addr = u_addr;
		this.u_phone = u_phone;
		this.u_email = u_email;
	}

	public UserDto(int u_no, String i_id, String u_name, String u_id, String u_pw, String u_addr, String u_phone,
			String u_grade, String u_enabled, String u_email) {
		super();
		this.u_no = u_no;
		this.i_id = i_id;
		this.u_name = u_name;
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_addr = u_addr;
		this.u_phone = u_phone;
		this.u_grade = u_grade;
		this.u_enabled = u_enabled;
		this.u_email = u_email;
	}
	
	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getI_id() {
		return i_id;
	}
	public void setI_id(String i_id) {
		this.i_id = i_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_addr() {
		return u_addr;
	}
	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getU_grade() {
		return u_grade;
	}
	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}
	public String getU_enabled() {
		return u_enabled;
	}
	public void setU_enabled(String u_enabled) {
		this.u_enabled = u_enabled;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	@Override
	public String toString() {
		return "UserDto [u_no=" + u_no + ", i_id=" + i_id + ", u_name=" + u_name + ", u_id=" + u_id + ", u_pw=" + u_pw
				+ ", u_addr=" + u_addr + ", u_phone=" + u_phone + ", u_grade=" + u_grade + ", u_enabled=" + u_enabled
				+ ", u_email=" + u_email + "]";
	}

}
