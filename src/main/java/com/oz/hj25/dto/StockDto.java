package com.oz.hj25.dto;

import java.util.Date;

public class StockDto {
	
	private int s_no;
	private String i_id;
	private int g_no;
	private int s_amt;
	private int ct_no;
	private String g_name;
	private int g_price;
	public StockDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StockDto(int s_no, String i_id, int g_no, int s_amt, int ct_no, String g_name, int g_price) {
		super();
		this.s_no = s_no;
		this.i_id = i_id;
		this.g_no = g_no;
		this.s_amt = s_amt;
		this.ct_no = ct_no;
		this.g_name = g_name;
		this.g_price = g_price;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getI_id() {
		return i_id;
	}
	public void setI_id(String i_id) {
		this.i_id = i_id;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public int getS_amt() {
		return s_amt;
	}
	public void setS_amt(int s_amt) {
		this.s_amt = s_amt;
	}
	public int getCt_no() {
		return ct_no;
	}
	public void setCt_no(int ct_no) {
		this.ct_no = ct_no;
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
		return "StockDto [s_no=" + s_no + ", i_id=" + i_id + ", g_no=" + g_no + ", s_amt=" + s_amt + ", ct_no=" + ct_no
				+ ", g_name=" + g_name + ", g_price=" + g_price + "]";
	}
	

}
