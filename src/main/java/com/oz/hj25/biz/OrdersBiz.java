package com.oz.hj25.biz;

import java.util.List;

import com.oz.hj25.dto.OrdersDto;

public interface OrdersBiz {
	
	public List<OrdersDto> ordersList(int ct_no);
	public List<OrdersDto> ordersId(String i_id,String o_inputDate);
	public List<OrdersDto> ordersName(String o_inputName);
	public List<OrdersDto> ordersDate(String o_inputDate);
	public int orderOneDelete(OrdersDto dto);
	public int orderDelete(String i_id);
	public int ordersUpdate(OrdersDto dto);
	public int ordersInsert(OrdersDto dto);

}
