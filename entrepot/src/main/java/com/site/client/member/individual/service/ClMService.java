package com.site.client.member.individual.service;

import com.site.client.member.individual.vo.ClMVO;

public interface ClMService {
	
	public int userIdConfirm(String m_id);
	public int memberInsert(ClMVO cmvo);
}
