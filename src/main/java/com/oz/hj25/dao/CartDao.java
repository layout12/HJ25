package com.oz.hj25.dao;

import java.util.List;

import com.oz.hj25.dto.CartDto;

public interface CartDao {

	
	public List<CartDto> selectAll(String i_id);
	public CartDto selectOne(CartDto dto);
	public int insert(CartDto dto);
	public int update(CartDto dto);
	public int delete(int c_no);
	public int allDelete(String i_id);
	
	
}
