package com.oz.hj25.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oz.hj25.dao.InfoDao;
import com.oz.hj25.dto.InfoDto;

@Service
public class InfoBizImpl implements InfoBiz {

	
	@Autowired
	public InfoDao dao;
	
	
	@Override
	public String selectI_id(String i_id) {
		
		return dao.selectI_id(i_id);
	}
	@Override
	public int insertInfo(InfoDto dto) {
		return dao.insertInfo(dto);
	}

}
