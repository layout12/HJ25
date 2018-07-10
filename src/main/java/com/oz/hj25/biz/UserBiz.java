package com.oz.hj25.biz;

import java.util.List;
import java.util.Map;

import com.oz.hj25.dto.UserDto;

public interface UserBiz {
	// 회占쏙옙 占쏙옙占쏙옙 占쏙옙체占쏙옙회
	public List<UserDto> selectAll(int pageNo);

	// ȸ��������ȸ
	public UserDto selectOne(String u_id);

	// ȸ������
	public int insert(UserDto dto);

	// ����������
	public int update(UserDto dto);

	// Ż��
	public int delete(int u_no);

	// �α���
	public UserDto userCheck(String u_id, String u_pw);

	////////////////////////////////////////////////////////////////////////////
	

	// id ã��
	public String UserIdSearch(String u_name, String u_email);

	// ��й�ȣ �O��
	public String UserPwSearch(UserDto dto);

	// ��й�ȣ ����
	public int UserPwUpdate(String u_id, String u_pw);

	////////////////////////////////////////////////////////////////////////////

	public String UdundantInspection(String column, String val);

	public int UserTotal();
	
	public int UserSearchTotal(String option,String input);
	
	public List<UserDto> UserSearch(int pageNo,String option, String input);
	
	public Map<String, Integer> UserPageSize(int pageNo);
	
	public Map UserSearchPageSize(int pageNo,String option, String input);
	
	public int UserDrop(String u_enabled,String u_id);
	
	public boolean pwEmail(String u_email,String u_id, String sysdate);
	
	public void smsAll();
}
