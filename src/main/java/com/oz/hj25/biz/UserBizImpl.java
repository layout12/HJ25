package com.oz.hj25.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.oz.hj25.gmail.Gmail;
import com.oz.hj25.sms.SendExample;
import com.oz.hj25.utill.Urlcoding;

import com.oz.hj25.dao.UserDao;
import com.oz.hj25.dto.UserDto;

@Service
public class UserBizImpl implements UserBiz {

	@Autowired
	private UserDao dao;

	@Transactional
	@Override
	public List<UserDto> selectAll(int pageNo) {
		// TODO Auto-generated method stub
		return dao.selectAll(pageNo);
	}

	@Transactional
	@Override
	public UserDto selectOne(String u_id) {
		// TODO Auto-generated method stub
		return dao.selectOne(u_id);
	}

	@Transactional
	@Override
	public int insert(UserDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Transactional
	@Override
	public int update(UserDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Transactional
	@Override
	public int delete(int u_no) {
		// TODO Auto-generated method stub
		return dao.delete(u_no);
	}

	@Transactional
	@Override
	public UserDto userCheck(String u_id,String u_pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);

		return dao.userCheck(map);
	}

	//////////////////////////////////////////////////////////////////////
	
	//id ã��
	@Override
	public String UserIdSearch(String u_name,String u_email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_name", u_name);
		map.put("u_email", u_email);

		
		return dao.UserIdSearch(map);
	}
	//��й�ȣ �O��
	@Override
	public String UserPwSearch(UserDto dto) {
		return dao.UserPwSearch(dto);
	}
	//��й�ȣ ����
	@Override
	public int UserPwUpdate(String u_id,String u_pw){
		Map<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);

		return dao.UserPwUpdate(map);
	}
	@Override
	public String UdundantInspection(String column, String val) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("column", column);
		map.put("val", val);
		return dao.UdundantInspection(map);
	}

	@Override
	public int UserTotal() {
		return dao.UserTotal();
	}
	

	@Override
	public int UserSearchTotal(String option, String input) {
		Map map = new HashMap();
		map.put("option", option);
		map.put("input", input);
		return dao.UserSearchTotal(map);
	}

	@Override
	public Map<String, Integer> UserPageSize(int pageNo) {
		int total =dao.UserTotal();
		int pageBlock=(int)(Math.ceil(pageNo/5.0));
		int pageNum=(int)(Math.ceil(dao.UserTotal()/10.0));
		int start=(pageBlock-1)*5+1;
		int end=start+4;
		if(pageBlock == pageNum) {
			end = total;
		}
		if(pageNum < end) {
			end = pageNum;
		}
		Map<String, Integer> map =new HashMap<String, Integer>();
		map.put("total", total);
		map.put("start", start);
		map.put("end", end);
		
		return map;
	}
	

	@Override
	public Map UserSearchPageSize(int pageNo, String option, String input) {
		int total =dao.UserTotal();
		int pageBlock=(int)(Math.ceil(pageNo/5.0));
		int pageNum=(int)(Math.ceil(dao.UserTotal()/10.0));
		int start=(pageBlock-1)*5+1;
		int end=start+4;
		if(pageBlock == pageNum) {
			end = total;
		}
		if(pageNum < end) {
			end = pageNum;
		}
		Map<String, Integer> map =new HashMap<String, Integer>();
		map.put("total", total);
		map.put("start", start);
		map.put("end", end);
		
		return map;
	}

	@Override
	public List<UserDto> UserSearch(int pageNo, String option, String input) {
		Map map = new HashMap();
		map.put("option", option);
		map.put("input", input);
		map.put("pageNo", pageNo);
		return dao.UserSearch(map);
	}

	@Override
	public int UserDrop(String u_enabled, String u_id) {
		Map map = new HashMap();
		map.put("u_enabled", u_enabled);
		map.put("u_id", u_id);
		return dao.UserDrop(map);
	}
	/////////////////////////////////////////////////////////////////////
	@Override
	public boolean pwEmail(String u_email,String u_id, String sysdate) {
		Urlcoding incode = new Urlcoding();
		System.out.println(123);
		String url = incode.urlincode("u_id="+u_id+"!&!sysdate="+sysdate);
		System.out.println(url);
		Gmail gmail = new Gmail();
		
		boolean res = gmail.sendId(url, u_email, u_id);
		
		System.out.println(res);
		
		
		
		return res;
	}
	@Override
	@Scheduled(cron="0 15 10 * * *")
	public void smsAll() {
	List<UserDto> List = dao.smsAll();
		SendExample sms = new SendExample();
		for(UserDto dto : List) {
			sms.SMS(dto.getU_phone());
		}
		
	}
	
	
}

