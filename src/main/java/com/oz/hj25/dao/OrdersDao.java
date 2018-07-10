package com.oz.hj25.dao;

import java.util.List;
import java.util.Map;

import com.oz.hj25.dto.OrdersDto;

public interface OrdersDao {

	public List<OrdersDto> ordersList(int ct_no);
	public List<OrdersDto> ordersId(Map<String,String> map);
	public List<OrdersDto> ordersName(String o_inputName);
	public List<OrdersDto> ordersDate(String o_inputDate);
	public int orderOneDelete(OrdersDto dto);
	public int orderDelete(String i_id);
	public int ordersUpdate(OrdersDto dto);
	public int ordersInsert(OrdersDto dto);
}
