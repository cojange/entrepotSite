package com.site.client.member.individual.dao;

import com.site.client.member.individual.vo.ClGmVO;
import com.site.client.member.individual.vo.ClMSecurity;
import com.site.client.member.individual.vo.ClMVO;

public interface ClMDao {
	//개인
	public ClMVO memberSelect(String m_id);
	public int memberUpdate(ClMVO mvo);
	public int memberInsert(ClMVO cmvo);
	public int memberDelete(String m_id);
	
	//단체
	public ClGmVO groupMemberSelect(String m_id);
	public ClGmVO groupComMemberSelect(String com_no);
	public int groupMemberUpdate(ClGmVO cmvo);
	public int groupMemberInsert(ClGmVO cmvo);
	
	//암호화
	public int securityInsert(ClMSecurity set);
	public ClMSecurity securitySelect(String m_Id);
	public int securityDelete(String m_Id) ;
	
	//구매페이지회원검색
	public ClMVO memberSellSelect(String m_num);
	public ClGmVO groupMemberSellSelect(String m_num);
	
}
