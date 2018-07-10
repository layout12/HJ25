package com.oz.hj25.biz;

import com.oz.hj25.dto.InfoDto;

public interface InfoBiz {


	public String selectI_id(String i_id);
	public int insertInfo(InfoDto dto);
}
