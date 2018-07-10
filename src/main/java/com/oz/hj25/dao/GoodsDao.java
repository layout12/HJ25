package com.oz.hj25.dao;

import java.util.List;

import com.oz.hj25.dto.GoodsDto;

public interface GoodsDao {
	
	public List<GoodsDto> goodsList(int ct_no);
	public List<GoodsDto> goodsName(String o_inputName);

}
