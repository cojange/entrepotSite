package com.site.client.member.sell.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.sell.dao.ClSellDAO;
import com.site.client.member.sell.vo.ClSellVO;

@Service
public class ClSellServiceImpl implements ClSellService {
	
	@Autowired
	private ClSellDAO clSellDAO;

	@Override
	public int paymentInsert(ClSellVO csvo) {	
		int result = 0;
		
		try {
			result = clSellDAO.paymentInsert(csvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
