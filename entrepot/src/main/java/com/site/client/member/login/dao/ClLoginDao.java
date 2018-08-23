package com.site.client.member.login.dao;

import com.site.client.member.login.vo.LoginVO;

public interface ClLoginDao {
	public LoginVO m_idSelect(String m_id);
	public LoginVO loginSelect(LoginVO lvo);

	public int loginHistoryInsert(LoginVO lvo) ;
	public int loginHistoryUpdate(LoginVO lvo);
	public LoginVO loginHistorySelect(String m_id); 
}
