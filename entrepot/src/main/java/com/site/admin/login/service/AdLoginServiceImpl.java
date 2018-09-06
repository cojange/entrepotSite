package com.site.admin.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.ctrl.adMember.vo.AdminVO;
import com.site.admin.login.dao.AdLoginDao;

@Service
public class AdLoginServiceImpl implements AdLoginService {

	@Autowired
	private AdLoginDao adLoginDao;

	@Override
	public AdminVO loginSelect(String ad_id, String ad_pw) {
		AdminVO secavo=null;
		
		//추후 보안 처리 등록
		secavo = new AdminVO();
		secavo.setAd_id(ad_id);
		secavo.setAd_pw(ad_pw);	
		
		//보안된 data로 조회
		AdminVO resavo = new AdminVO();
		resavo = adLoginDao.loginSelect(secavo);
		
		return resavo;
	}
	
}
