package com.site.admin.ctrl.adPartner.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.ctrl.adPartner.dao.AdPartnerDao;
import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;
import com.site.admin.ctrl.adPartner.vo.MagazinePartnerVO;

@Service
public class AdPartnerServiceImpl implements AdPartnerService {
	
	@Autowired
	private AdPartnerDao adPartnerDao; 
	
	//잡지거래처 리스트
	@Override
	public List<CourierPartnerVO> couPartnerList(CourierPartnerVO cpvo) {
		List<CourierPartnerVO> couPartnerList = null;
		couPartnerList = adPartnerDao.couPartnerList(cpvo);
		return couPartnerList;
	}
	
	//택배거래처 리스트
	@Override
	public List<MagazinePartnerVO> magPartnerList(MagazinePartnerVO mpvo) {
		List<MagazinePartnerVO> magPartnerList = null;
		magPartnerList = adPartnerDao.magPartnerList(mpvo);
		return magPartnerList;
	}
	
	//잡지거래처 등록
	@Override
	public int magazineInsert(MagazinePartnerVO mpvo) {
		int result = 0;
		try {
			result = adPartnerDao.magazineInsert(mpvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
}
