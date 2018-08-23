package com.site.client.magazine.list.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.magazine.ditail.vo.MagazineVO;
import com.site.client.magazine.list.dao.ListDao;

@Service
public class ListServiceImpl implements ListService {
	Logger logger = Logger.getLogger(ListService.class);
	
	@Autowired
	private ListDao listDao;

	@Override
	public List<MagazineVO> magazineList(MagazineVO mvo) {
		List<MagazineVO> alist =null;
		
		alist = listDao.magazineList(mvo);
		for(MagazineVO ad : alist) {
			ad.setPd_salecost((int)(ad.getPd_sale()-(ad.getPd_sale()*(ad.getPd_rate()*0.01))));
		}
		return alist;
	}
	
}
