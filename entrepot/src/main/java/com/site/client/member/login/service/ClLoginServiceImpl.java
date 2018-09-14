package com.site.client.member.login.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.site.client.member.individual.dao.ClMDao;
import com.site.client.member.individual.vo.ClMSecurity;
import com.site.client.member.individual.vo.ClMVO;
import com.site.client.member.login.dao.ClLoginDao;
import com.site.client.member.login.vo.LoginVO;
import com.site.common.util.OpenCrypt;

@Service
public class ClLoginServiceImpl implements ClLoginService {
	Logger logger = Logger.getLogger(ClLoginServiceImpl.class);
	@Autowired
	private ClMDao clMDao;
	@Autowired
	private ClLoginDao clLoginDao;
	
	@Override
	public LoginVO m_idSelect(String m_id) {
		return clLoginDao.m_idSelect(m_id); 
	}
	@Override
	public LoginVO loginSelect(String m_id, String m_pwd) {
		LoginVO  vo = null;
		ClMSecurity sec = clMDao.securitySelect(m_id);
		if(sec!=null){
			m_pwd = new String(OpenCrypt.getSHA256(m_pwd,sec.getSalt()));

		LoginVO lvo = new LoginVO();
		lvo.setM_id(m_id);
		lvo.setM_pwd(m_pwd);

		vo = clLoginDao.loginSelect(lvo);
		} 
		return vo;
	}
	@Transactional
	@Override
	public int loginHistoryInsert(LoginVO lvo) {
		int result;
			if(m_idSelect(lvo.getM_id())==null){
			result = 1;
			} else{
				LoginVO vo = loginHistorySelect(lvo.getM_id());
				if(vo == null){
					clLoginDao.loginHistoryInsert(lvo);
				}
				result = 2;
			}
		return result;
	}
	@Transactional
	@Override
	public int loginHistoryUpdate(LoginVO lvo) {
		return clLoginDao.loginHistoryUpdate(lvo);
	}
	@Override
	public LoginVO loginHistorySelect(String m_id) {
		return clLoginDao.loginHistorySelect(m_id);
	}
	@Override
	public ClMVO idSelect(ClMVO cvo) {
		return clLoginDao.idSelect(cvo);
	}
	@Override
	public ClMVO pwdSelect(ClMVO cvo) {
		return clLoginDao.pwdSelect(cvo);
	}

}
