package com.oz.hj25.dto;

public class InfoDto {
	private String i_id;
	private String i_name;
	private String i_addr;
	private String i_detailAddr;
	private String i_postNo;
	
	
	
	public InfoDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public InfoDto(String i_id, String i_name, String i_addr, String i_detailAddr, String i_postNo) {
		super();
		this.i_id = i_id;
		this.i_name = i_name;
		this.i_addr = i_addr;
		this.i_detailAddr = i_detailAddr;
		this.i_postNo = i_postNo;
	}
	public String getI_id() {
		return i_id;
	}
	public void setI_id(String i_id) {
		this.i_id = i_id;
	}
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public String getI_addr() {
		return i_addr;
	}
	public void setI_addr(String i_addr) {
		this.i_addr = i_addr;
	}
	
	public String getI_detailAddr() {
		return i_detailAddr;
	}


	public void setI_detailAddr(String i_detailAddr) {
		this.i_detailAddr = i_detailAddr;
	}


	public String getI_postNo() {
		return i_postNo;
	}


	public void setI_postNo(String i_postNo) {
		this.i_postNo = i_postNo;
	}



	

}
