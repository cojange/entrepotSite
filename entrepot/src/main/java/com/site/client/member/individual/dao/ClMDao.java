package com.site.client.member.individual.dao;

import com.site.client.member.individual.vo.ClMSecurity;
import com.site.client.member.individual.vo.ClMVO;

public interface ClMDao {
	public ClMVO memberSelect(String m_id);
	public int memberInsert(ClMVO cmvo);
	
	public int securityInsert(ClMSecurity set);
	public ClMSecurity securitySelect(String userId);
}
