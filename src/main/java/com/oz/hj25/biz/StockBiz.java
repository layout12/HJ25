package com.oz.hj25.biz;

import java.util.List;

import com.oz.hj25.dto.StockDto;

public interface StockBiz {

	public List<StockDto> stockList(String i_id);
	public int stockUpdate(StockDto dto);
	public int stockDelete(int s_no);
}
