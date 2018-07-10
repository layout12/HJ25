package com.oz.hj25.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oz.hj25.dao.AnswerDao;
import com.oz.hj25.dto.AnswerDto;

@Service
public class AnswerBizImpl implements AnswerBiz {

	@Autowired
	private AnswerDao dao;
	@Transactional(readOnly=true)
	@Override
	public List<AnswerDto> selectAll(int b_no) {
		// TODO Auto-generated method stub
		return dao.selectAll(b_no);
	}

	@Transactional(readOnly=true)
	@Override
	public int insert(AnswerDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}
	@Transactional(readOnly=true)
	@Override
	public int update(AnswerDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}
	@Transactional(readOnly=true)
	@Override
	public int delete(int a_no) {
		// TODO Auto-generated method stub
		return dao.delete(a_no);
	}
	@Override
	public int Reinsert(AnswerDto dto) {
		return dao.Reinsert(dto);
	}
	
	@Override
	public int answerCount(int a_no) {
		return dao.answerCount(a_no);
	}
	@Override
	public int answerUpDel(int a_no) {
		return dao.answerUpDel(a_no);
	}

}
