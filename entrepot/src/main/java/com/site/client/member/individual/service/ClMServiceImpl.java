package com.site.client.member.individual.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.site.client.member.individual.dao.ClMDao;
import com.site.client.member.individual.vo.ClMSecurity;
import com.site.client.member.individual.vo.ClMVO;
import com.site.common.util.OpenCrypt;
import com.site.common.util.Util;

@Service
public class ClMServiceImpl implements ClMService {
		
	Logger logger = Logger.getLogger(ClMServiceImpl.class);
	
	@Autowired
	private ClMDao clMDao;

	@Override
	public int m_idConfirm(String m_id) {
		int result;
		if(clMDao.memberSelect(m_id) != null) {
			result =1;
		}else {
			result =2;
		}
		return result;
	}
	
	@Transactional
	@Override
	public int memberInsert(ClMVO cmvo) {
		if(clMDao.memberSelect(cmvo.getM_id()) != null) {
			throw new RuntimeException();
		}else {
			ClMSecurity sec = new ClMSecurity();
			sec.setM_id(cmvo.getM_id());
			sec.setSalt(Util.getRandomString());
			clMDao.securityInsert(sec);
			cmvo.setM_pwd(new String(OpenCrypt.getSHA256(cmvo.getM_pwd(),sec.getSalt())));
			int result = clMDao.memberInsert(cmvo);
			return result;
		}
	}
	
}
