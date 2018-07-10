package com.oz.hj25.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oz.hj25.dto.GoodsDto;

@Repository
public class GoodsDaoImpl implements GoodsDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.oz.hj25.goods.";
	@Override
	public List<GoodsDto> goodsList(int ct_no) {
		List<GoodsDto> res =sqlSession.selectList(nameSpace+"goodsList", ct_no);
		return res;
	}
	@Override
	public List<GoodsDto> goodsName(String o_inputName) {
		List<GoodsDto> res =sqlSession.selectList(nameSpace+"goodsName", o_inputName);
		return res;
	}
	

}
