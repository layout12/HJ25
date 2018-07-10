package com.oz.hj25.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oz.hj25.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String nameSpace = "com.oz.hj25.user.";

	@Override
	public List<UserDto> selectAll(int pageNo) {
		List<UserDto> list = new ArrayList<UserDto>();
		list = sqlSession.selectList(nameSpace + "UserList",pageNo);
		return list;
	}

	@Override
	public UserDto selectOne(String u_id) {
		UserDto detail = sqlSession.selectOne(nameSpace + "UserDetail", u_id);
		return detail;
	}

	@Override
	public int insert(UserDto dto) {
		int res = sqlSession.insert(nameSpace + "UserInsert", dto);
		return res;
	}

	@Override
	public int update(UserDto dto) {
		int res = sqlSession.update(nameSpace + "UserUpdate", dto);
		return res;
	}

	@Override
	public int delete(int u_no) {
		int res = sqlSession.update(nameSpace + "UserDelete", u_no);
		return res;
	}

	@Override
	public UserDto userCheck(Map<String, String> map) {
		UserDto check = sqlSession.selectOne(nameSpace + "UserCheck", map);
		return check;
	}


	// id ì°¾å ìì
	@Override
	public String UserIdSearch(Map<String,String> map) {
		String i_id = sqlSession.selectOne(nameSpace+"UserIdSearch", map);
		return i_id;
	}

	// å ììæ©å ì«ï¿½ å í¨å ìì
	@Override
	public String UserPwSearch(UserDto dto) {
		String i_id = sqlSession.selectOne(nameSpace+"UserPwSearch", dto);
		return i_id;
	}

	// å ììæ©å ì«ï¿½ å ììå ìì
	@Override
	public int UserPwUpdate(Map<String,String> map) {
		int res = sqlSession.update(nameSpace+"UserPwUpdate", map);
		return res;
	}

	@Override
	public String UdundantInspection(Map<String,String> map) {
		System.out.println("dao"+map);
		String i_id = sqlSession.selectOne(nameSpace+"UdundantInspection", map);
		return i_id;
	}

	@Override
	public int UserTotal() {
		int res = sqlSession.selectOne(nameSpace+"UserTotal");
		return res;
	}
	

	@Override
	public int UserSearchTotal(Map map) {
		int res =sqlSession.selectOne(nameSpace, map);
		return res;
	}

	@Override
	public List<UserDto> UserSearch(Map map) {
		List<UserDto> res = sqlSession.selectList(nameSpace+"UserSearchList",map);
		return res;
	}

	@Override
	public int UserDrop(Map map) {
		int res =sqlSession.update(nameSpace+"UserDrop", map);
		return res;
	}
	@Override
	public List<UserDto> smsAll(){
		List<UserDto> list = sqlSession.selectList(nameSpace+"smsAll");
		return list;
	}
	
	
}
