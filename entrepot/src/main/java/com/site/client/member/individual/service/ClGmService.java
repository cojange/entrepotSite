package com.site.client.member.individual.service;

import com.site.client.member.individual.vo.ClGmVO;

public interface ClGmService {
	
	public int gm_comConfirm(String com_no);
	public int groupMemberInsert(ClGmVO cmvo);
}
