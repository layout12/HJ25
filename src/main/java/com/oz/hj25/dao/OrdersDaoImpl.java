package com.oz.hj25.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oz.hj25.dto.OrdersDto;

@Repository
public class OrdersDaoImpl implements OrdersDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.oz.hj25.orders.";
	@Override
	public List<OrdersDto> ordersList(int ct_no) {
		List<OrdersDto> res = sqlSession.selectList(nameSpace+"ordersList",ct_no);
		return res;
	}

	@Override
	public List<OrdersDto> ordersId(Map<String,String> map) {
		List<OrdersDto> res = sqlSession.selectList(nameSpace+"ordersSearch", map);
		return res;
	}

	@Override
	public List<OrdersDto> ordersName(String o_inputName) {
		List<OrdersDto> res = sqlSession.selectList(nameSpace+"ordersName", o_inputName);
		return res;
	}

	@Override
	public List<OrdersDto> ordersDate(String o_inputDate) {
		List<OrdersDto> res =sqlSession.selectList(nameSpace+"ordersDate", o_inputDate);
		return res;
	}
	
	@Override
	public int orderOneDelete(OrdersDto dto) {
		int res = sqlSession.delete(nameSpace+"ordersOneDelete", dto);
		return res;
	}

	@Override
	public int orderDelete(String i_id) {
		int res = sqlSession.delete(nameSpace+"ordersDelete", i_id);
		return res;
	}

	@Override
	public int ordersUpdate(OrdersDto dto) {
		int res = sqlSession.update(nameSpace+"ordersUpdate", dto);
		return res;
	}

	@Override
	public int ordersInsert(OrdersDto dto) {
		int res = sqlSession.insert(nameSpace+"ordersInsert", dto);
		return res;
	}

}
