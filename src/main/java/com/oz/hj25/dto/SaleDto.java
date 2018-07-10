package com.oz.hj25.dto;


public class SaleDto {

	private int sal_no;
	private String i_id;
	private int sal_amt;
	private String sal_date;
	private String g_name;
	private int g_price;
	private String search_date;
	private String search_avg;
	private int g_no;
	
	
	

	public SaleDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
  //�Ǹ���ȸ
	public SaleDto(String i_id, String sal_date) {
		super();
		this.i_id = i_id;
		this.sal_date = sal_date;
	}

   //�Ǹ� Update
	public SaleDto(int sal_no, int sal_amt) {
		super();
		this.sal_no = sal_no;
		this.sal_amt = sal_amt;
	}

  //�Ǹ� Insezrt
	public SaleDto(String i_id, int sal_amt,String g_name) {
		super();
		this.i_id = i_id;
		this.sal_amt = sal_amt;
		this.g_name = g_name;
	}


	public SaleDto(int sal_no, String i_id, int sal_amt, String sal_date, String g_name, int g_price) {
		super();
		this.sal_no = sal_no;
		this.i_id = i_id;
		this.sal_amt = sal_amt;
		this.sal_date = sal_date;
		this.g_name = g_name;
		this.g_price = g_price;
	}
	






	public SaleDto(int sal_no, String i_id, int sal_amt, String sal_date, String g_name, int g_price,
			String search_date, String search_avg, int g_no) {
		super();
		this.sal_no = sal_no;
		this.i_id = i_id;
		this.sal_amt = sal_amt;
		this.sal_date = sal_date;
		this.g_name = g_name;
		this.g_price = g_price;
		this.search_date = search_date;
		this.search_avg = search_avg;
		this.g_no = g_no;
	}

	public int getSal_no() {
		return sal_no;
	}

	public void setSal_no(int sal_no) {
		this.sal_no = sal_no;
	}

	public String getI_id() {
		return i_id;
	}

	public void setI_id(String i_id) {
		this.i_id = i_id;
	}

	public int getSal_amt() {
		return sal_amt;
	}

	public void setSal_amt(int sal_amt) {
		this.sal_amt = sal_amt;
	}

	public String getSal_date() {
		return sal_date;
	}

	public void setSal_date(String sal_date) {
		this.sal_date = sal_date;
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


	public String getSearch_date() {
		return search_date;
	}

	public void setSearch_date(String search_date) {
		this.search_date = search_date;
	}

	public String getSearch_avg() {
		return search_avg;
	}

	public void setSearch_avg(String search_avg) {
		this.search_avg = search_avg;
	}
	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	@Override
	public String toString() {
		return "{\"search_date\":\""+search_date+"\", \"search_avg\":\""+search_avg+"\"}";
	}

}
