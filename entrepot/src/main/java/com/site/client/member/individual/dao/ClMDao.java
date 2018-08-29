package com.site.client.member.individual.dao;

import com.site.client.member.individual.vo.ClGmVO;
import com.site.client.member.individual.vo.ClMSecurity;
import com.site.client.member.individual.vo.ClMVO;

public interface ClMDao {
	public ClMVO memberSelect(String m_id);
	public ClGmVO groupMemberSelect(String m_id);
	public ClGmVO groupComMemberSelect(String com_no);
	public int memberInsert(ClMVO cmvo);
	public int groupMemberInsert(ClGmVO cgmvo);
	
	public int securityInsert(ClMSecurity set);
	public ClMSecurity securitySelect(String m_Id);
	
}
