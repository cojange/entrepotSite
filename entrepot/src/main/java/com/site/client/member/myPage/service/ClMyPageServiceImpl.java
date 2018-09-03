package com.site.client.member.myPage.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.login.controller.ClLoginController;
import com.site.client.member.myPage.dao.ClMyPageDao;
import com.site.client.member.myPage.vo.ClMyPageVO;
import com.site.client.member.myPage.vo.ClOrderListVO;


@Service
public class ClMyPageServiceImpl implements ClMyPageService {
	
	private Logger logger = Logger.getLogger(ClLoginController.class);
	@Autowired
	private ClMyPageDao clMyPageDao;
	
	@Override
	//찜리스트
	public List<ClMyPageVO> whishList(ClMyPageVO myPageVo) { 	
		List<ClMyPageVO> myWhishlist = clMyPageDao.whishList(myPageVo);
		int saleval=0;
		//할인가격을계산하기위한 
		/*for(ClMyPageVO whishlistVo : myWhishlist) {
			whishlistVo.setPd_sale(whishlistVo.getPd_sale()*whishlistVo.getPd_cost());
			saleval=(int)(whishlistVo.getPd_sale()*(whishlistVo.getPd_rate()*0.01));
			whishlistVo.setPd_salecost((int)(whishlistVo.getPd_salecost()-(saleval)));
			logger.info("pd_sale :"+whishlistVo.getPd_sale());
			logger.info("pd_salecost :"+whishlistVo.getPd_salecost());
	      }*/
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
