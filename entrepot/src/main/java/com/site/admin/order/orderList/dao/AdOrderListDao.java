package com.site.admin.order.orderList.dao;

import java.util.List;

import com.site.admin.order.orderList.vo.AdChangeVO;
import com.site.admin.order.orderList.vo.AdMonthKeyVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdOrderProductVO;
import com.site.admin.order.orderList.vo.AdRefundVO;
import com.site.admin.order.orderList.vo.AdSellListVO;
import com.site.common.vo.CommonVO;

public interface AdOrderListDao {
	
	public List<AdSellListVO> getSellList();
	public List<AdOrderListVO> getOrderList(AdSellListVO slvo);
	public List<AdSellListVO> getSearchDate(AdMonthKeyVO mkvo);
	public List<AdOrderProductVO> getOrderProduct(CommonVO cvo);
	public List<AdRefundVO> getRefundList(CommonVO cvo);
	public List<AdChangeVO> getChangeList(CommonVO cvo);
	public int cancelRefund(List<String> refundNum);
	public int cancelChange(List<String> changeNum);
	public int confirmRefund(List<String> refundNum);
	public int confirmChange(List<String> changeNum);
	public void confirmOrder(CommonVO cvo);
}
