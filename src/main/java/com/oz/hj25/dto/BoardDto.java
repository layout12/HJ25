package com.oz.hj25.dto;

import java.util.Date;

public class BoardDto {

	private int b_no;
	private String u_id;
	private String b_title;
	private String b_content;
	private Date b_date;
	private int b_hits;
	private int total;
	private String u_grade;
	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public BoardDto(int b_no, String u_id, String b_title, String b_content, Date b_date, int b_hits, int total,
			String u_grade) {
		super();
		this.b_no = b_no;
		this.u_id = u_id;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_date = b_date;
		this.b_hits = b_hits;
		this.total = total;
		this.u_grade = u_grade;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getB_hits() {
		return b_hits;
	}

	public void setB_hits(int b_hits) {
		this.b_hits = b_hits;
	}

	public String getU_grade() {
		return u_grade;
	}


	public void setU_grade(String u_grade) {
		this.u_grade = u_grade;
	}


	@Override
	public String toString() {
		return "BoardDto [b_no=" + b_no + ", u_id=" + u_id + ", b_title=" + b_title + ", b_content=" + b_content
				+ ", b_date=" + b_date + ", b_hits=" + b_hits + ", total=" + total + ", u_grade=" + u_grade + "]";
	}


	
}
