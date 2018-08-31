package com.site.client.member.myPage.dao;

import java.util.List;

import com.site.client.member.myPage.vo.ClOrderListVO;

public interface ClMyPageDao {

	public List<ClOrderListVO> orderList(ClOrderListVO orderVo);
}
