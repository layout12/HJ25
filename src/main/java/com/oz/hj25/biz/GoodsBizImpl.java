package com.oz.hj25.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.hj25.dao.GoodsDao;
import com.oz.hj25.dto.GoodsDto;

@Service
public class GoodsBizImpl implements GoodsBiz {

	@Autowired
	private GoodsDao dao;
	@Override
	public List<GoodsDto> goodsList(int ct_no) {
		// TODO Auto-generated method stub
		return dao.goodsList(ct_no);
	}
	@Override
	public List<GoodsDto> goodsName(String o_inputName) {
		// TODO Auto-generated method stub
		return dao.goodsName(o_inputName);
	}

}
