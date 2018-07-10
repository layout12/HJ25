package com.oz.hj25.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.hj25.dao.SaleDao;
import com.oz.hj25.dao.SaleDaoImpl;
import com.oz.hj25.dto.SaleDto;

@Service
public class SaleBizImpl implements SaleBiz {

	@Autowired
	private SaleDao dao;

	@Override
	public List<SaleDto> selectAll(SaleDto dto) {
		return dao.selectAll(dto);
	}

	@Override
	public List<SaleDto> goodsSearchList(String i_id, String g_name, String startDate, String endDate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("i_id", i_id);
		map.put("g_name", g_name);
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		return dao.goodsSearchList(map);
	}

	@Override
	public List<SaleDto> addrSearchList(String g_name, String i_id, String startDate, String endDate) {
		String i_addr = dao.infoAddr(i_id);
		String addr= i_addr.split(" ")[2];

		Map<String, String> map = new HashMap<String, String>();
		map.put("g_name", g_name);
		map.put("i_addr", addr);
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		return dao.addrSearchList(map);
	}

	@Override
	public List<SaleDto> autoOrderSearshList(String i_id) {

		return dao.autoOrderSearshList(i_id);
	}

	@Override
	public int Insert(SaleDto dto) {

		return dao.Insert(dto);
	}

	@Override
	public int Update(SaleDto dto) {

		return dao.Update(dto);
	}

	@Override
	public int Delete(int sal_no) {

		return dao.Delete(sal_no);
	}

}
