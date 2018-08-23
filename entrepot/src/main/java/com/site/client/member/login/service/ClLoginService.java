package com.site.client.member.login.service;

import com.site.client.member.login.vo.LoginVO;

public interface ClLoginService {
	
		public LoginVO m_idSelect(String m_id);
		public LoginVO loginSelect(String m_id, String m_pwd);

		public int loginHistoryInsert(LoginVO lvo);
		public int loginHistoryUpdate(LoginVO lvo);
		public LoginVO loginHistorySelect(String m_id);
	
}
