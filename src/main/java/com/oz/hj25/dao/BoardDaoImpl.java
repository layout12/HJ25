package com.oz.hj25.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oz.hj25.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace="com.oz.hj25.board.";

	@Override
	public int totalPage() {
		int res = sqlSession.selectOne(nameSpace+"Boardtotal");
		return res;
	}

	@Override
	public List<BoardDto> selectAll(int pageNo) {
		List<BoardDto> list =new ArrayList<BoardDto>();
		list=sqlSession.selectList(nameSpace+"BoardList",pageNo);
		return list;
	}

	@Override
	public BoardDto selectOne(int b_no) {
		BoardDto detail= sqlSession.selectOne(nameSpace+"BoardDetail",b_no);
		return detail;
	}

	@Override
	public int insert(BoardDto dto) {
		int res = sqlSession.insert(nameSpace+"BoardInsert",dto);
		return res;
	}

	@Override
	public int update(BoardDto dto) {
		int res =sqlSession.update(nameSpace+"BoardUpdate",dto);
		return res;
	}

	@Override
	public int delete(int b_no) {
		int res =sqlSession.delete(nameSpace+"BoardDelete",b_no);
		return res;
	}

	@Override
	public List<BoardDto> search(Map map) {
		List<BoardDto> search =new ArrayList<BoardDto>();
		search = sqlSession.selectList(nameSpace+"BoardSearch",map);
		return search;
	}

	@Override
	public int searchTotalPage(Map map) {
		int res = sqlSession.selectOne(nameSpace+"BoardSearchTotal",map);
		return res;
	}

	@Override
	public int boardCount(int b_no) {
		int res = sqlSession.update(nameSpace+"BoardCount",b_no);
		return res;
	}

	@Override
	public int boardMulDel(Map map) {
		int res =sqlSession.delete(nameSpace+"BoardMulDel",map);
		return res;
	}
	
}
