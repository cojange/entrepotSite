package com.site.client.member.myPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.myPage.dao.ClMyPageDao;
import com.site.client.member.myPage.vo.ClOrderListVO;


@Service
public class ClMyPageServiceImpl implements ClMyPageService {
	
	@Autowired
	private ClMyPageDao clMyPageDao;

	@Override
	public List<ClOrderListVO> orderList(ClOrderListVO orderVo) {
		List<ClOrderListVO> list = clMyPageDao.orderList(orderVo);
		return list;
	}

}
