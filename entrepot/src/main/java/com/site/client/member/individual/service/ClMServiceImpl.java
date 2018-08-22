package com.site.client.member.individual.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.individual.dao.ClMDao;
import com.site.client.member.individual.vo.ClMSecurity;
import com.site.client.member.individual.vo.ClMVO;
import com.site.common.util.Util;

@Service
public class ClMServiceImpl implements ClMService {
		
	@Autowired
	private ClMDao clMDao;

	@Override
	public int userIdConfirm(String m_id) {
		int result;
		if(clMDao.memberSelect(m_id) != null) {
			result =1;
		}else {
			result =2;
		}
		return result;
	}

	@Override
	public int memberInsert(ClMVO cmvo) {
		if(clMDao.memberSelect(cmvo.getM_id()) != null) {
			throw new RuntimeException();
		}else {
			ClMSecurity sec = new ClMSecurity();
			sec.setM_id(cmvo.getM_id());
			sec.setSalt(Util.getRandomString());
			clMDao.securityInsert(sec);
			int result = clMDao.memberInsert(cmvo);
			return result;
		}
	}
}
