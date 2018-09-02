package com.site.admin.magazine.adMagazine.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.magazine.adMagazine.dao.AdMagazineDao;
import com.site.client.magazine.ditail.vo.MagazineVO;

@Service
public class AdMagazineServiceImpl implements AdMagazineService {
	Logger logger = Logger.getLogger(AdMagazineServiceImpl.class);
	
	@Autowired
	private AdMagazineDao adMagazineDao;
	
	//상품 리스트 구현
	@Override
	public List<MagazineVO> adMagazineList(MagazineVO mgvo) {
		List<MagazineVO> adMagazineList = null;
		
		adMagazineList = adMagazineDao.adMagazineList(mgvo);
		return adMagazineList;
	}
}
