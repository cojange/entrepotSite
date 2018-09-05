package com.site.client.magazine.list.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.magazine.ditail.vo.MagazineVO;
import com.site.client.magazine.list.dao.ListDao;
import com.site.client.member.myPage.vo.ClMyPageVO;

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
			ad.setPd_sale(ad.getPd_sale()*ad.getPd_cost());
			ad.setPd_salecost((int)(ad.getPd_sale()-(ad.getPd_sale()*(ad.getPd_rate()*0.01))));
			
		}
		return alist;
	}

	@Override
	public int listcount(MagazineVO mvo) {
		int mylist=0;
		mylist=listDao.listcount(mvo);
		
		return mylist;
		
	}

	@Override
	public List<MagazineVO> bastlist(MagazineVO mvo) {
		List<MagazineVO> alist=null;
		alist = listDao.bastlist(mvo);
		for(MagazineVO ad : alist) {
			ad.setPd_sale(ad.getPd_sale()*ad.getPd_cost());
			ad.setPd_salecost((int)(ad.getPd_sale()-(ad.getPd_sale()*(ad.getPd_rate()*0.01))));
			if(ad.getDt_target().indexOf("해외") != -1) {
				ad.setListkey(1);
			}else {
				ad.setListkey(3);
				
			}
		}
		return alist;
	}

	@Override
	public List<MagazineVO> jlist(MagazineVO mvo) {
		List<MagazineVO> alist=null;
		alist =listDao.jlist(mvo);
		return alist;
	}

	@Override
	public List<MagazineVO> elist(MagazineVO mvo) {
		List<MagazineVO> alist=null;
		alist = listDao.elist(mvo);
		return alist;
	}

	@Override
	public List<MagazineVO> aplist(MagazineVO mvo) {
		List<MagazineVO> alist=null;
		alist = listDao.aplist(mvo);
		for(MagazineVO ad : alist) {
			ad.setPd_sale(ad.getPd_sale()*ad.getPd_cost());
			ad.setPd_salecost((int)(ad.getPd_sale()-(ad.getPd_sale()*(ad.getPd_rate()*0.01))));
			if(ad.getDt_target().indexOf("해외") != -1) {
				ad.setListkey(1);
			}else {
				ad.setListkey(3);
				
			}
		}
		return alist;
	}

	@Override
	public int card(ClMyPageVO pvo) {
		int result =0;
		try {
			result =listDao.cardcheck(pvo);
			if(result ==1) {
				result = listDao.cardinsert(pvo);
			}else {
				result = listDao.cardupdate(pvo);
			}
		}catch(Exception e) {
			e.printStackTrace();
			result =0;
		}
		return result;
	}
	

	


	
}
