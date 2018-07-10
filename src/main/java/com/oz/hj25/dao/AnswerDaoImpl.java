package com.oz.hj25.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oz.hj25.dto.AnswerDto;

@Repository
public class AnswerDaoImpl implements AnswerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.oz.hj25.answer.";
	
	@Override
	public List<AnswerDto> selectAll(int b_no) {
		List<AnswerDto> list=new ArrayList<AnswerDto>();
		list=sqlSession.selectList(nameSpace+"AnswerList",b_no);
		return list;
	}

	@Override
	public int insert(AnswerDto dto) {
		int res =sqlSession.insert(nameSpace+"AnswerInsert",dto);
		return res;
	}

	@Override
	public int update(AnswerDto dto) {
		int res = sqlSession.update(nameSpace+"AnswerUpdate",dto);
		return res;
	}

	@Override
	public int delete(int a_no) {
		int res =sqlSession.delete(nameSpace+"AnswerDelete",a_no);
		return res;
	}

	@Override
	public int Reinsert(AnswerDto dto) {
		int res =sqlSession.insert(nameSpace+"AnswerInsertRe", dto);
		return res;
	}

	@Override
	public int answerCount(int a_no) {
		int res =sqlSession.selectOne(nameSpace+"AnswerCount", a_no);
		return res;
	}

	@Override
	public int answerUpDel(int a_no) {
		int res =sqlSession.update(nameSpace+"AnswerUpDel", a_no);
		return res;
	}
	
	

}
