package com.oz.hj25.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oz.hj25.dao.CartDaoImpl;
import com.oz.hj25.dto.CartDto;
@Service
public class CartBizImpl implements CartBiz {

	@Autowired
	private CartDaoImpl dao;

	@Transactional
	@Override
	public List<CartDto> selectAll(String i_id) {

		return dao.selectAll(i_id);
	}

	@Override
	public CartDto selectOne(CartDto dto) {

		return dao.selectOne(dto);
	}
	@Override
	public int insert(CartDto dto) {

		return dao.insert(dto);
	}

	@Override
	public int update(CartDto dto) {

		return dao.update(dto);
	}

	@Override
	public int delete(int c_no) {
		return dao.delete(c_no);
	}

	@Override
	public int allDelete(String i_id) {

		return dao.allDelete(i_id);
	}

}
