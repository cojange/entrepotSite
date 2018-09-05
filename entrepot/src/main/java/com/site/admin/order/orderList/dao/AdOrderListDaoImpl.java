package com.site.admin.order.orderList.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.order.orderList.vo.AdChangeVO;
import com.site.admin.order.orderList.vo.AdMonthKeyVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdOrderProductVO;
import com.site.admin.order.orderList.vo.AdRefundVO;
import com.site.admin.order.orderList.vo.AdSellListVO;
import com.site.common.vo.CommonVO;

@Repository
public class AdOrderListDaoImpl implements AdOrderListDao {

	@Autowired
	private SqlSession session;
	
	//주문 리스트
	@Override
	public List<AdSellListVO> getSellList() {
		return session.selectList("getSellList");
	}

	//판매리스트
	@Override
	public List<AdOrderListVO> getOrderList(AdSellListVO slvo) {
		return session.selectList("getOrderList", slvo);
	}
	//날짜별 조회
	@Override
	public List<AdSellListVO> getSearchDate(AdMonthKeyVO mkvo) {
		return session.selectList("getSearchDate",mkvo);
	}
	//주문내역조회
	@Override
	public List<AdOrderProductVO> getOrderProduct(CommonVO cvo){
		return session.selectList("getOrderProduct", cvo);
	}
	//환불리스트 조회
	@Override
	public List<AdRefundVO> getRefundList(CommonVO cvo){
		return session.selectList("getRefundList",cvo);
	}
	
	//교환리스트 조회
	@Override
	public List<AdChangeVO> getChangeList(CommonVO cvo){
		return session.selectList("getChangeList",cvo);
	}
	
	//환불 승인 거절
	@Override
	public int cancelRefund(List<String> refundNum) {
		return session.update("cancelRefund",refundNum);
	}

	@Override
	public int cancelChange(List<String> changeNum) {
		return session.update("cancelChange",changeNum);
	}
	
	//환불 승인
		@Override
		public int confirmRefund(List<String> refundNum) {
			return session.update("confirmRefund",refundNum);
		}

		@Override
		public int confirmChange(List<String> changeNum) {
			return session.update("confirmChange",changeNum);
		}

		@Override
		public void confirmOrder(CommonVO cvo) {
			session.update("confirmOrder",cvo);
		}
}
