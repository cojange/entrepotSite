package com.site.client.magazine.ditail.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.magazine.ditail.dao.DitailDao;
import com.site.client.magazine.ditail.vo.MagazineVO;

@Service
public class DitailServiceImpl implements DitailService {
	Logger logger = Logger.getLogger(DitailServiceImpl.class);

	@Autowired
	private DitailDao ditailDao;

	@Override
	public MagazineVO magazineDetail(MagazineVO mvo) {
		MagazineVO magazine = null;
		try {
			magazine = ditailDao.magazineDetail(mvo);
			
			magazine.setPd_sale(magazine.getPd_sale()*magazine.getPd_cost());
			magazine.setPd_salecost((int)(magazine.getPd_sale()-(magazine.getPd_sale()*(magazine.getPd_rate()*0.01))));
		}catch(Exception e) {
			e.printStackTrace();
			magazine=null;
		}
		return magazine;
	}

	@Override
	public List<MagazineVO> magazinesum(MagazineVO magazine) {
		List<MagazineVO> alist =null;
		
		return alist =ditailDao.magazinesum(magazine);
					
	}

	@Override
	public MagazineVO magazineDetailfree(MagazineVO magazine) {
		MagazineVO free = null;
		try {
			free = ditailDao.magazineDetailfree(magazine);
		}catch(Exception e) {
			e.printStackTrace();
			free=null;
		}
		
		return free;
	}
}
