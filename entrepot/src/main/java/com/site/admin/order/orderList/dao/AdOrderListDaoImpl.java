package com.site.admin.order.orderList.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdSellListVO;

@Repository
public class AdOrderListDaoImpl implements AdOrderListDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<AdSellListVO> getSellList() {
		return session.selectList("getSellList");
	}

	@Override
	public List<AdOrderListVO> getOrderList(AdSellListVO slvo) {
		return session.selectList("getOrderList", slvo);
	}
}
