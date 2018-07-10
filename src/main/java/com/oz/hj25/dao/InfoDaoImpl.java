package com.oz.hj25.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oz.hj25.dto.InfoDto;

@Repository
public class InfoDaoImpl implements InfoDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.oz.hj25.info.";
	
	
	@Override
	public String selectI_id(String i_id) {
	String res = sqlSession.selectOne(nameSpace+"select_I_id", i_id);
		
		return res;
	}
	@Override
	public int insertInfo(InfoDto dto) {
		int res = sqlSession.insert(nameSpace+"infoInsert", dto);
		return res;
	}

}
