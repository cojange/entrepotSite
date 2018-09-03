package com.site.admin.order.orderList.service;

import java.util.List;

import com.site.admin.order.orderList.vo.AdMonthKeyVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdOrderProductVO;
import com.site.admin.order.orderList.vo.AdSellListVO;
import com.site.common.vo.CommonVO;

public interface AdOrderListService {
	
	public List<AdSellListVO> getSellList();
	public List<AdOrderListVO> getOrderList(AdSellListVO slvo);
	public List<AdSellListVO> getSearchDate(AdMonthKeyVO mkvo);
	public List<AdOrderProductVO> getOrderProduct(CommonVO cvo);
/*	public List<AdOrderProductVO> getKindOrder(String selectkey);*/
}
