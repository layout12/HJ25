package com.oz.hj25.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.hj25.dao.StockDao;
import com.oz.hj25.dto.StockDto;

@Service
public class StockBizImpl implements StockBiz {

	@Autowired
	private StockDao dao;
	@Override
	public List<StockDto> stockList(String i_id) {
		// TODO Auto-generated method stub
		return dao.stockList(i_id);
	}

	@Override
	public int stockUpdate(StockDto dto) {
		// TODO Auto-generated method stub
		return dao.stockUpdate(dto);
	}

	@Override
	public int stockDelete(int s_no) {
		// TODO Auto-generated method stub
		return dao.stockDelete(s_no);
	}

}
