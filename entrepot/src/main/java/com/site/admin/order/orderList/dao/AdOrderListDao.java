package com.site.admin.order.orderList.dao;

import java.util.List;

import com.site.admin.order.orderList.vo.AdMonthKeyVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdSellListVO;

public interface AdOrderListDao {
	
	public List<AdSellListVO> getSellList();
	public List<AdOrderListVO> getOrderList(AdSellListVO slvo);
	public List<AdSellListVO> getSearchDate(AdMonthKeyVO mkvo);
}
