package com.oz.hj25.dto;

public class GoodsDto {

	private int g_no;
	private int ct_no;
	private String g_name;
	private int g_price;
	public GoodsDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodsDto(int g_no, int c_no, String g_name, int g_price) {
		super();
		this.g_no = g_no;
		this.ct_no = c_no;
		this.g_name = g_name;
		this.g_price = g_price;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public int getC_no() {
		return ct_no;
	}
	public void setC_no(int c_no) {
		this.ct_no = c_no;
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
		return "GoodsDto [g_no=" + g_no + ", c_no=" + ct_no + ", g_name=" + g_name + ", g_price=" + g_price + "]";
	}

	
}
