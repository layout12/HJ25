package com.oz.hj25.biz;

import java.util.List;
import java.util.Map;

import com.oz.hj25.dto.SaleDto;


public interface SaleBiz {

	public List<SaleDto> selectAll(SaleDto dto); 
	public List<SaleDto> goodsSearchList(String i_id,String g_name,String startDate,String endDate);
	public List<SaleDto> addrSearchList(String g_name,String i_id,String startDate,String endDate);
	public List<SaleDto> autoOrderSearshList(String i_id);
	public int Insert(SaleDto dto);
	public int Update(SaleDto dto);
	public int Delete(int sal_no);
}
