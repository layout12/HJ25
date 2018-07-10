package com.oz.hj25.biz;

import java.util.List;
import java.util.Map;

import com.oz.hj25.dto.BoardDto;

public interface BoardBiz {

	
	public List<BoardDto> selectAll(int pageNo);
	public BoardDto selectOne(int b_no);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);
	public int delete(int b_no);
	public List<BoardDto> search(String option,String input,int pageNo);
	public int totalPage();
	public int searchTotalPage(String option,String input);
	public Map<String,Integer> pageSize(int pageNo);
	public Map<String,Object> searchPageSize(int pageNo,String option, String input);
	public int boardCount(int b_no);
	public int boardMulDel(String[] b_no);
}
