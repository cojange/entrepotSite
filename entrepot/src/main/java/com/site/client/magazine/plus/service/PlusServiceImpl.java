package com.site.client.magazine.plus.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.magazine.ditail.vo.MagazineVO;
import com.site.client.magazine.plus.dao.PlusDao;
import com.site.client.magazine.plus.vo.PlusVO;

@Service
public class PlusServiceImpl implements PlusService {
	Logger logger = Logger.getLogger(PlusServiceImpl.class);
	
	@Autowired
	private PlusDao plusDao;

	@Override
	public List<PlusVO> plusList(Integer pd_num) {
		List<PlusVO>mylist=null;
		mylist= plusDao.plusList(pd_num);
		for(PlusVO av:mylist) {
			av.setCm_choice(plusDao.pluschoice(av));
		}
		return mylist;
	}
}
