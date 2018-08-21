package com.site.admin.ctrl.adPartner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.ctrl.adPartner.dao.AdPartnerDao;
import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;

@Service
public class AdPartnerServiceImpl implements AdPartnerService {
	
	@Autowired
	private AdPartnerDao adPartnerDao; 

	@Override
	public List<CourierPartnerVO> couPartnerList(CourierPartnerVO cpvo) {
		List<CourierPartnerVO> couPartnerList = null;
		couPartnerList = adPartnerDao.couPartnerList(cpvo);
		return couPartnerList;
	}
}
