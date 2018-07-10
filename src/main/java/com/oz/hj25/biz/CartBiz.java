package com.oz.hj25.biz;

import java.util.List;

import com.oz.hj25.dto.CartDto;

public interface CartBiz {

	public List<CartDto> selectAll(String i_id);
	public CartDto selectOne(CartDto dto);
	public int insert(CartDto dto);
	public int update(CartDto dto);
	public int delete(int c_no);
	public int allDelete(String i_id);
}
