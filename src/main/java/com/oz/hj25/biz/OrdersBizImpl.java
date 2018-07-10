package com.oz.hj25.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.hj25.dao.OrdersDao;
import com.oz.hj25.dto.OrdersDto;

@Service
public class OrdersBizImpl implements OrdersBiz {

	@Autowired
	private OrdersDao dao;
	@Override
	public List<OrdersDto> ordersList(int ct_no) {
		// TODO Auto-generated method stub
		return dao.ordersList(ct_no);
	}

	@Override
	public List<OrdersDto> ordersId(String i_id,String o_inputDate) {
		Map<String, String> map =new HashMap<String, String>();
		map.put("i_id", i_id);
		map.put("o_inputDate", o_inputDate);
		return dao.ordersId(map);
	}

	@Override
	public List<OrdersDto> ordersName(String o_inputName) {
		// TODO Auto-generated method stub
		return dao.ordersName(o_inputName);
	}

	@Override
	public List<OrdersDto> ordersDate(String o_inputDate) {
		// TODO Auto-generated method stub
		return dao.ordersDate(o_inputDate);
	}
	
	@Override
	public int orderOneDelete(OrdersDto dto) {
		return dao.orderOneDelete(dto);
	}

	@Override
	public int orderDelete(String i_id) {
		return dao.orderDelete(i_id);
	}

	@Override
	public int ordersUpdate(OrdersDto dto) {
		return dao.ordersUpdate(dto);
	}

	@Override
	public int ordersInsert(OrdersDto dto) {
		// TODO Auto-generated method stub
		return dao.ordersInsert(dto);
	}

}
