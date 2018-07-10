package com.oz.hj25.dao;

import java.util.List;
import java.util.Map;

import com.oz.hj25.dto.SaleDto;


public interface SaleDao {

	public List<SaleDto> selectAll(SaleDto dto); 
	public List<SaleDto> goodsSearchList(Map<String,String> map);
	public List<SaleDto> addrSearchList(Map<String,String> map);
	public List<SaleDto> autoOrderSearshList(String i_id);
	public int Insert(SaleDto dto);
	public int Update(SaleDto dto);
	public int Delete(int sal_no);
	public String infoAddr(String i_id);
	
	
}
