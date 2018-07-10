package com.oz.hj25.dto;

public class CartDto {

	private int c_no;
	private String i_id;
	private int g_no;
	private int c_amt;
	private int gt_no;
	private String g_name;
	private int g_price;

	public CartDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartDto(String i_id, int g_no, int c_amt) {
		super();
		this.i_id = i_id;
		this.g_no = g_no;
		this.c_amt = c_amt;
	}

	
	public CartDto(String i_id, int g_no) {
		super();
		this.i_id = i_id;
		this.g_no = g_no;
	}

	public CartDto(int c_no, int c_amt) {
		super();
		this.c_no = c_no;
		this.c_amt = c_amt;
	}

	public CartDto(int c_no, String i_id, int g_no, int c_amt, int gt_no, String g_name, int g_price) {
		super();
		this.c_no = c_no;
		this.i_id = i_id;
		this.g_no = g_no;
		this.c_amt = c_amt;
		this.gt_no = gt_no;
		this.g_name = g_name;
		this.g_price = g_price;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getI_id() {
		return i_id;
	}

	public void setI_id(String i_id) {
		this.i_id = i_id;
	}

	public int getg_no() {
		return g_no;
	}

	public void setg_no(int g_no) {
		this.g_no = g_no;
	}

	public int getC_amt() {
		return c_amt;
	}

	public void setC_amt(int c_amt) {
		this.c_amt = c_amt;
	}

	public int getGt_no() {
		return gt_no;
	}

	public void setGt_no(int gt_no) {
		this.gt_no = gt_no;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public int getG_price() {
		return g_price;
	}

	public void setG_price(int g_price) {
		this.g_price = g_price;
	}

	@Override
	public String toString() {
		return "CartDto [c_no=" + c_no + ", i_id=" + i_id + ", g_no=" + g_no + ", c_amt=" + c_amt + ", gt_no=" + gt_no
				+ ", g_name=" + g_name + ", g_price=" + g_price + "]";
	}

}
