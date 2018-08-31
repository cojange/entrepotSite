package com.site.client.member.myPage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.member.myPage.vo.ClOrderListVO;

@Repository
public class ClMyPageDaoImpl implements ClMyPageDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public List<ClOrderListVO> orderList(ClOrderListVO orderVo) {		
		return session.selectList("orderList", orderVo);
	}

}
