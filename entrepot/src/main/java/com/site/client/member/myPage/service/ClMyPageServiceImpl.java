package com.site.client.member.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.myPage.dao.ClMyPageDao;
import com.site.client.member.myPage.vo.ClMyPageVO;
import com.site.client.member.myPage.vo.ClOrderListVO;


@Service
public class ClMyPageServiceImpl implements ClMyPageService {
	
	@Autowired
	private ClMyPageDao clMyPageDao;
	
	@Override
	//찜리스트
	public List<ClMyPageVO> whishList(ClMyPageVO myPageVo) { 
		List<ClMyPageVO> myWhishlist = clMyPageDao.whishList(myPageVo);
		return myWhishlist;
	} 

	@Override
	//장바구니
	public List<ClMyPageVO> cartList(ClMyPageVO myPageVo) {
		List<ClMyPageVO> myCartlist = clMyPageDao.cartList(myPageVo);
		return myCartlist;
	}

	@Override
	public List<ClOrderListVO> orderList(ClOrderListVO orderVo) {
		List<ClOrderListVO> orderlist = clMyPageDao.orderList(orderVo);
		return orderlist;
	}


	

}
