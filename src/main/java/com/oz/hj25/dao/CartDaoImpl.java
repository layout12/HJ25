package com.oz.hj25.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oz.hj25.dto.CartDto;
@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.oz.hj25.cart.";
	
	@Override
	public List<CartDto> selectAll(String i_id) {
        List<CartDto> list = new ArrayList<CartDto>();
        list = sqlSession.selectList(nameSpace+"cartList", i_id);
		return list;
	}
	@Override
	public CartDto selectOne(CartDto dto) {
      CartDto SearchDto  = new CartDto();
      SearchDto = sqlSession.selectOne(nameSpace+"cartSelectOne", dto);
		return SearchDto;
	}

	@Override
	public int insert(CartDto dto) {
	int res = 0;
	res = sqlSession.insert(nameSpace+"cartInsert", dto);
		return res;
	}

	@Override
	public int update(CartDto dto) {
		int res = 0;
		res = sqlSession.update(nameSpace+"cartUpdate", dto); 
		return res;
	}

	@Override
	public int delete(int c_no) {
		int res  = 0;
		res = sqlSession.delete(nameSpace+"cartDelete", c_no);
		
		return res;
	}

	@Override
	public int allDelete(String i_id) {
		int res = 0;
		res = sqlSession.delete(nameSpace+"cartAlldel", i_id);
		return res;
	}

}
