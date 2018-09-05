package com.site.client.member.myPage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.member.myPage.vo.ClMyPageVO;
import com.site.client.member.myPage.vo.ClOrderListVO;

@Repository
public class ClMyPageDaoImpl implements ClMyPageDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	//찜리스트
	public List<ClMyPageVO> whishList(ClMyPageVO myPageVo) {
		return session.selectList("whishList", myPageVo);
	} 

	@Override
	//장바구니
	public List<ClMyPageVO> cartList(ClMyPageVO myPageVo) {
		return session.selectList("cartList", myPageVo);
	}

	@Override
	public List<ClOrderListVO> orderList(ClOrderListVO orderVo) {
		return session.selectList("orderList", orderVo);
	}

	@Override
	public int listDelete(ClMyPageVO myPageVo) {
		return session.delete("listDelete",myPageVo);
	}


	

}
