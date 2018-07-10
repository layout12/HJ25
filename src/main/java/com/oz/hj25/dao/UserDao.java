
package com.oz.hj25.dao;

import java.util.List;
import java.util.Map;

import com.oz.hj25.dto.UserDto;

public interface UserDao {
	
	//회占쏙옙 占쏙옙占쏙옙 占쏙옙체占쏙옙회
	public List<UserDto> selectAll(int pageNo);
	//회占쏙옙占쏙옙占쏙옙占쏙옙회
	public UserDto selectOne(String u_id);
	
	//회占쏙옙占쏙옙占쏙옙
	public int insert(UserDto dto);
	//占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙
	public int update(UserDto dto);
	//탈占쏙옙
	public int delete(int u_no);
	//占싸깍옙占쏙옙
	public UserDto userCheck(Map<String,String> map);
	////////////////////////////////////////////////////////////////////////////
	
	//id 찾占쏙옙
	public String UserIdSearch(Map<String,String> map);
	//占쏙옙橘占싫� 占폨占쏙옙
	public String UserPwSearch(UserDto dto);
	//占쏙옙橘占싫� 占쏙옙占쏙옙
	public int UserPwUpdate(Map<String,String> map);
	
	public String UdundantInspection(Map<String,String> map);

	public int UserTotal();
	
	public int UserSearchTotal(Map map);
	
	public List<UserDto> UserSearch(Map map);
	
	public int UserDrop(Map map);
	
	public List<UserDto> smsAll();
}
