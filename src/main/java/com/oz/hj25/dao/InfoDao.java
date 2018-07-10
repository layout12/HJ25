package com.oz.hj25.dao;

import com.oz.hj25.dto.InfoDto;

public interface InfoDao {


	
	public String selectI_id(String i_id);
	public int insertInfo(InfoDto dto);
}
