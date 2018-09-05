package com.site.admin.order.orderList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.order.orderList.dao.AdOrderListDao;
import com.site.admin.order.orderList.vo.AdMonthKeyVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdOrderProductVO;
import com.site.admin.order.orderList.vo.AdSellListVO;
import com.site.common.vo.CommonVO;

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

	//주문목록 조회
	@Override
	public List<AdOrderListVO> getOrderList(AdSellListVO slvo) {
		List<AdOrderListVO> orderList = adOrderListDao.getOrderList(slvo);
		return orderList;
	}
	
	//날짜기반 조회
	@Override
	public List<AdSellListVO> getSearchDate(AdMonthKeyVO mkvo) {
		List<AdSellListVO> searchDateList = adOrderListDao.getSearchDate(mkvo);
		return searchDateList;
	}
	
	//발주 목록
	@Override
	public List<AdOrderProductVO> getOrderProduct(CommonVO cvo){
		List<AdOrderProductVO> orderPList = adOrderListDao.getOrderProduct(cvo);
		return orderPList;
	}
	
/*	//상태 발주목록
	@Override
	public List<AdOrderProductVO> getKindOrder(String selectkey) {

		return null;
	}*/

}
