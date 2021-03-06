package com.site.client.member.myPage.service;

import java.util.List;

import com.site.client.member.myPage.vo.ClMyPageVO;
import com.site.client.member.myPage.vo.ClOrderListVO;

public interface ClMyPageService {
	
	public List<ClMyPageVO> whishList(ClMyPageVO myPageVo);//찜리스트
	public List<ClMyPageVO> cartList(ClMyPageVO myPageVo);//장바구니
	public List<ClOrderListVO> orderList(ClOrderListVO orderVo);//주문내역
	public int listDelete(ClMyPageVO myPageVo);//마이페이지 찜&장바구니 리스트 삭제
	public int orderListInsert(ClOrderListVO ordervo);//주문리스트 인서트(장바구니&찜테이블 삭제후발동)
	
	

}
