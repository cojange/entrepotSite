package com.site.client.member.myPage.dao;

import java.util.List;

import com.site.client.member.myPage.vo.ClMyPageVO;
import com.site.client.member.myPage.vo.ClOrderListVO;

public interface ClMyPageDao {
	
	
	public List<ClMyPageVO> whishList(ClMyPageVO myPageVo);//찜리스트
	public List<ClMyPageVO> cartList(ClMyPageVO myPageVo);//장바구니 
	public List<ClOrderListVO> orderList(ClOrderListVO orderVo);//주문내역
	public int listDelete(ClMyPageVO myPageVo);//마이페이지 찜&장바구니 리스트 삭제
}
