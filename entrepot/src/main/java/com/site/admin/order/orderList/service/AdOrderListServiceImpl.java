package com.site.admin.order.orderList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.order.orderList.dao.AdOrderListDao;
import com.site.admin.order.orderList.vo.AdSellListVO;

@Service
public class AdOrderListServiceImpl implements AdOrderListService {

	@Autowired
	private AdOrderListDao adOrderListDao;

	//전체 판매목록 조회
	@Override
	public List<AdSellListVO> getSellList() {
		
		List<AdSellListVO> sellList = adOrderListDao.getSellList();
		
		return sellList;
	}
}
