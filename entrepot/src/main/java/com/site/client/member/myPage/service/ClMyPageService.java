package com.site.client.member.myPage.service;

import java.util.List;

import com.site.client.member.myPage.vo.ClOrderListVO;

public interface ClMyPageService {
	
	public List<ClOrderListVO> orderList(ClOrderListVO orderVo);

}
