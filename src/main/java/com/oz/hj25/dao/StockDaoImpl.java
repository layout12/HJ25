package com.oz.hj25.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oz.hj25.dto.StockDto;

@Repository
public class StockDaoImpl implements StockDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.oz.hj25.stock.";
	
	@Override
	public List<StockDto> stockList(String i_id) {
		List<StockDto> list = sqlSession.selectList(nameSpace+"stockList", i_id);
		return list;
	}

	@Override
	public int stockUpdate(StockDto dto) {
		int res = sqlSession.update(nameSpace+"stockUpdate", dto);
		return res;
	}

	@Override
	public int stockDelete(int s_no) {
		int res = sqlSession.delete(nameSpace+"stockDelete", s_no);
		return res;
	}

}
