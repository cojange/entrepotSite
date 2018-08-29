package com.site.client.member.individual.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.individual.dao.ClMDao;
import com.site.client.member.individual.vo.ClGmVO;
import com.site.client.member.individual.vo.ClMSecurity;
import com.site.common.util.OpenCrypt;
import com.site.common.util.Util;

@Service
public class ClGmServiceImpl implements ClGmService {

	Logger logger = Logger.getLogger(ClMServiceImpl.class);
	
	@Autowired
	private ClMDao clMDao;

	
	@Override
	public int gm_comConfirm(String com_no) {
		int resultg;
		if(clMDao.groupComMemberSelect(com_no) != null) {
			resultg =1;
		}else {
			resultg =2;
		}
		return resultg;
	}

	@Override
	public int groupMemberInsert(ClGmVO cgmvo) {
		if(clMDao.groupMemberSelect(cgmvo.getM_id()) != null) {
			throw new RuntimeException();
		}else {
			ClMSecurity sec = new ClMSecurity();
			sec.setM_id(cgmvo.getM_id());
			sec.setSalt(Util.getRandomString());
			clMDao.securityInsert(sec);
			cgmvo.setM_pwd(new String(OpenCrypt.getSHA256(cgmvo.getM_pwd(),sec.getSalt())));
			int result = clMDao.groupMemberInsert(cgmvo);
			return result;
		}
	}



	
}
