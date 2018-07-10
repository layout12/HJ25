package com.oz.hj25.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oz.hj25.dao.BoardDao;
import com.oz.hj25.dto.BoardDto;

@Service
public class BoardBizImpl implements BoardBiz {

	@Autowired
	private BoardDao dao;

	@Override
	public int totalPage() {
		return dao.totalPage();
	}
	@Transactional(readOnly=true)
	@Override
	public List<BoardDto> selectAll(int pageNo) {
		return dao.selectAll(pageNo);
	}
	@Transactional(readOnly=true)
	@Override
	public BoardDto selectOne(int b_no) {
		return dao.selectOne(b_no);
	}
	@Transactional(readOnly=true)
	@Override
	public int insert(BoardDto dto) {
		return dao.insert(dto);
	}
	@Transactional(readOnly=true)
	@Override
	public int update(BoardDto dto) {
		return dao.update(dto);
	}

	@Transactional(readOnly=true)
	@Override
	public int delete(int b_no) {
		// TODO Auto-generated method stub
		return dao.delete(b_no);
	}
	
	//게시판 리스트
	@Transactional(readOnly=true)
	@Override
	public List<BoardDto> search(String option,String input,int pageNo) {
		Map map = new HashMap();
		map.put("option", option);
		map.put("input", input);
		map.put("pageNo", pageNo);
		return dao.search(map);
	}
	
	//게시판 검색
	@Override
	public int searchTotalPage(String option, String input) {
		Map map = new HashMap();
		map.put("option", option);
		map.put("input", input);
		return dao.searchTotalPage(map);
	}
	
	//게시판 페이징
	@Override
	public Map<String, Integer> pageSize(int pageNo) {
		int total =dao.totalPage();   //전체 글 갯수
		int pageBlock=(int)(Math.ceil(pageNo/5.0));   //페이지블록 1~5페이지까지 나옴.
		int pageNum=(int)(Math.ceil(dao.totalPage()/10.0));  //한 페이지당 게시물 수 10개가 나올 때 1페이지
		int start=(pageBlock-1)*5+1;   //페이지의 시작 번호->1,11,21,31..로 나오게 하는 계산
		int end=start+4;     //페이지의 끝 번호 -> 10,20,30,40..로 나오게 하는 계산
				
		if(pageBlock == pageNum) {
			end = total;
		}
		//한 페이지에  게시물 수에 상관없이 무조건 start부터 end까지 페이지 번호가 나오는 것을 현재 끝번호까지만 나오게..
		if(pageNum < end) {
			end = pageNum;
		}
		
		//계산한것을 맵에 넣어줘서 controller에 뿌려줄거임
		Map<String, Integer> map =new HashMap<String, Integer>();
		map.put("total", total);
		map.put("start", start);
		map.put("end", end);
		map.put("pageBlock", pageBlock);
		map.put("pageNum", pageNum);
		
		return map;
	}
	
	//게시판 검색처리된 페이징
	@Override
	public Map<String, Object> searchPageSize(int pageNo, String option, String input) {
		
		//option과 input을 map에서 먼저 설정
		Map<String, String> res =new HashMap<String, String>();
		res.put("option", option);
		res.put("input", input);
		
		//
		int total = dao.searchTotalPage(res); //전체 글 갯수
		int pageBlock=(int)(Math.ceil(pageNo/5.0));    //페이지블록 1~5페이지까지 나옴.
		int pageNum=(int)(Math.ceil(dao.searchTotalPage(res)/10.0));  //한 페이지당 게시물 수 10개가 나올 때 1페이지
		int start=(pageBlock-1)*5+1;   //페이지의 시작 번호->1,11,21,31..로 나오게 하는 계산
		int end=start+4;     //페이지의 끝 번호 -> 10,20,30,40..로 나오게 하는 계산
		
		if(pageBlock == pageNum) {
			end = total;
		}
		
		//한 페이지에  게시물 수에 상관없이 무조건 start부터 end까지 페이지 번호가 나오는 것을 현재 끝번호까지만 나오게..
		if(pageNum < end) {
			end = pageNum;
		}
		
		//계산한것을 맵에 넣어줘서 controller에 뿌려줄거임
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("total", total);
		map.put("start", start);
		map.put("end", end);
		
		return map;
	}
	
	@Override
	public int boardCount(int b_no) {
		return dao.boardCount(b_no);
	}
	
	@Override
	public int boardMulDel(String[] b_no) {
		Map map = new HashMap();
		map.put("b_no", b_no);
		return dao.boardMulDel(map);
	}

	
}
