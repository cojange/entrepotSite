package com.site.client.member.sell.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.myPage.dao.ClMyPageDao;
import com.site.client.member.myPage.vo.ClOrderListVO;
import com.site.client.member.sell.dao.ClSellDAO;
import com.site.client.member.sell.vo.ClSellVO;

@Service
public class ClSellServiceImpl implements ClSellService {
	
	@Autowired
	private ClSellDAO clSellDAO;
	@Autowired
	private ClMyPageDao clMyPageDao;

	@Override
	public int paymentInsert(ClSellVO csvo) {	
		int result = 0;
		int resultDelete = 0;
		
		try {
			result = clSellDAO.paymentInsert(csvo);
			if(result==1) {
				resultDelete = clMyPageDao.listAllDelete();
				return resultDelete;
			}else if(result != 1) {
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
