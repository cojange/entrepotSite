package com.site.admin.order.orderList.service;

import java.util.List;

import com.site.admin.order.orderList.vo.AdChangeVO;
import com.site.admin.order.orderList.vo.AdMonthKeyVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdOrderProductVO;
import com.site.admin.order.orderList.vo.AdRefundVO;
import com.site.admin.order.orderList.vo.AdSellListVO;
import com.site.common.vo.CommonVO;

public interface AdOrderListService {
	
	public List<AdSellListVO> getSellList();
	public List<AdOrderListVO> getOrderList(AdSellListVO slvo);
	public List<AdSellListVO> getSearchDate(AdMonthKeyVO mkvo);
	public List<AdOrderProductVO> getOrderProduct(CommonVO cvo);
	public List<AdRefundVO> getRefundList(CommonVO cvo);
	public List<AdChangeVO> getChangeList(CommonVO cvo);
	public String cancelRefund(List<String> refundNum);
	public String cancelChange(List<String> changeNum);
	public String confirmRefund(List<String> refundNum);
	public String confirmChange(List<String> changeNum);
	public void confirmOrder(CommonVO cvo);
	
}
