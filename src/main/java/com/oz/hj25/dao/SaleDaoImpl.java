package com.oz.hj25.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oz.hj25.dto.SaleDto;
@Repository
public class SaleDaoImpl implements SaleDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.oz.hj25.sale.";
	
	@Override
	public List<SaleDto> selectAll(SaleDto dto) {
		List<SaleDto> list = new ArrayList<SaleDto>();
		
		list = sqlSession.selectList(nameSpace+"saleList", dto);
		
		return list;
	}

	@Override
	public List<SaleDto> goodsSearchList(Map<String, String> map) {
	List<SaleDto> list = new ArrayList<SaleDto>();
	list = sqlSession.selectList(nameSpace+"goodsSearchList", map);
		return list;
	}

	@Override
	public List<SaleDto> addrSearchList(Map<String, String> map) {
		List<SaleDto> list = new ArrayList<SaleDto>();
		list = sqlSession.selectList(nameSpace+"addrSearchList", map);
			return list;
	}

	@Override
	public List<SaleDto> autoOrderSearshList(String i_id){
		List<SaleDto> list = new ArrayList<SaleDto>();
		list = sqlSession.selectList(nameSpace+"autoOrderSearchList", i_id);
		
		return list;
	}
	@Override
	public int Insert(SaleDto dto) {
	int res = 0;
	System.out.println("??");
	res = sqlSession.insert(nameSpace+"saleInsert", dto);
	System.out.println("����");	
	return res;
	}

	@Override
	public int Update(SaleDto dto) {
		int res = 0;
		res = sqlSession.update(nameSpace+"saleUpdate", dto);
		return res;
	}

	@Override
	public int Delete(int sal_no) {
		int res = 0;
		res = sqlSession.delete(nameSpace+"saleDelete", sal_no);
			return res;
	}

	@Override
	public String infoAddr(String i_id) {
		String i_addr = sqlSession.selectOne(nameSpace + "InfoAddr", i_id);
		return i_addr;
	}

}
