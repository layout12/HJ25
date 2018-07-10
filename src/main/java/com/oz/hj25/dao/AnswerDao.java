package com.oz.hj25.dao;

import java.util.List;

import com.oz.hj25.dto.AnswerDto;

public interface AnswerDao {
	
	public List<AnswerDto> selectAll(int b_no);
	public int insert(AnswerDto dto);
	public int update(AnswerDto dto);
	public int delete(int a_no);
	public int Reinsert(AnswerDto dto);
	public int answerCount(int a_no);
	public int answerUpDel(int a_no);
}
