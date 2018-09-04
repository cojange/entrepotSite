package com.site.admin.order.orderList.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.order.orderList.dao.AdOrderListDao;
import com.site.admin.order.orderList.vo.AdChangeVO;
import com.site.admin.order.orderList.vo.AdMonthKeyVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdOrderProductVO;
import com.site.admin.order.orderList.vo.AdRefundVO;
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
	
	//환불 목록
	@Override
	public List<AdRefundVO> getRefundList(CommonVO cvo){
		List<AdRefundVO> refundList = adOrderListDao.getRefundList(cvo);
		return refundList;
	}
	
	//교환 목록
	@Override
	public List<AdChangeVO> getChangeList(CommonVO cvo){
		List<AdChangeVO> changeList = adOrderListDao.getChangeList(cvo);
		return changeList;
	}
	//환불 승인거절
	@Override
	public String cancelRefund(List<String> refundNum) {
		
		int result = adOrderListDao.cancelRefund(refundNum);
		
		if(result !=0) {
			return "success";
		}else {
			return "fails";
		}
	}

	@Override
	public String cancelChange(List<String> changeNum) {
		int result = adOrderListDao.cancelChange(changeNum);
		if(result !=0) {
			return "success";
		}else {
			return "fails";
		}
		
	}

	//환불 승인거절
		@Override
		public String confirmRefund(List<String> refundNum) {
			
			int result = adOrderListDao.confirmRefund(refundNum);
			
			if(result !=0) {
				return "success";
			}else {
				return "fails";
			}
		}

		@Override
		public String confirmChange(List<String> changeNum) {
			int result = adOrderListDao.confirmChange(changeNum);
			if(result !=0) {
				return "success";
			}else {
				return "fails";
			}
			
		}
		//발주 확인
		@Override
		public void confirmOrder(CommonVO cvo) {

			adOrderListDao.confirmOrder(cvo);
		}
		

}
