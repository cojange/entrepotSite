package com.site.admin.ctrl.adPartner.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.ctrl.adPartner.dao.AdPartnerDao;
import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;
import com.site.admin.ctrl.adPartner.vo.MagazinePartnerVO;
import com.site.admin.magazine.adMagazine.vo.MagazineSearchVO;

@Service
public class AdPartnerServiceImpl implements AdPartnerService {
	Logger logger = Logger.getLogger(AdPartnerServiceImpl.class);
	
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

	//택배거래처 등록
	@Override
	public int courierInsert(CourierPartnerVO cpvo) {
		int result = 0;
		try {
			result = adPartnerDao.courierInsert(cpvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
	
	//잡지거래처 수정
	@Override
	public int magUpdate(MagazinePartnerVO mpvo) {
		if(mpvo.getChecked() != null)
		logger.info("checked : " + mpvo.getChecked());
		logger.info("com_no : " + mpvo.getCom_no());
		
		int newDao = 0;
		int oldDao = 0;
		
		
		if(mpvo.getChecked() != null){
			newDao = adPartnerDao.magUpdate(mpvo);
			return newDao +1;
		}else {
			MagazinePartnerVO newMpvo = new MagazinePartnerVO();
			newMpvo = adPartnerDao.magPartnerData(mpvo);
			newDao = adPartnerDao.magUpdate(mpvo);
			oldDao = adPartnerDao.closedMagInsert(newMpvo);
			return newDao+oldDao;
		}
	
	}
	
	//잡지 코드 리스트
	@Override
	public List<MagazineSearchVO> magCodeList(MagazineSearchVO msvo) {
		List<MagazineSearchVO> magCodeList = null;
		magCodeList = adPartnerDao.magCodeList(msvo);
		return magCodeList;
	}
	
	//잡지 코드 등록
	@Override
	public int magCodeInsert(MagazineSearchVO msvo) {
		int result = 0;
		try {
			result = adPartnerDao.magCodeInsert(msvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}
}
