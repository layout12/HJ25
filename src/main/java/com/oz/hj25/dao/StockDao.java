package com.oz.hj25.dao;

import java.util.HashMap;
import java.util.List;

import com.oz.hj25.dto.StockDto;

public interface StockDao {

	public List<StockDto> stockList(String i_id);
	public int stockUpdate(StockDto dto);
	public int stockDelete(int s_no);
}
