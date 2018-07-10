package com.oz.hj25.dto;

import java.util.Date;

public class OrdersDto {
	
	private int o_no;
	private String i_id;
	private int g_no;
	private int o_amt;
	private Date o_date;
	private int ct_no;
	private String g_name;
	private int g_price;
	public OrdersDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrdersDto(int o_no, String i_id, int g_no, int o_amt, Date o_date, int ct_no, String g_name, int g_price) {
		super();
		this.o_no = o_no;
		this.i_id = i_id;
		this.g_no = g_no;
		this.o_amt = o_amt;
		this.o_date = o_date;
		this.ct_no = ct_no;
		this.g_name = g_name;
		this.g_price = g_price;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
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
	public int getO_amt() {
		return o_amt;
	}
	public void setO_amt(int o_amt) {
		this.o_amt = o_amt;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
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
		return "OrdersDto [o_no=" + o_no + ", i_id=" + i_id + ", g_no=" + g_no + ", o_amt=" + o_amt + ", o_date="
				+ o_date + ", ct_no=" + ct_no + ", g_name=" + g_name + ", g_price=" + g_price + "]";
	}
	
}
