package com.site.admin.adBoard.personalBoard.dao;

import java.util.List;

import com.site.admin.adBoard.personalBoard.vo.PbReplyVO;
import com.site.admin.adBoard.personalBoard.vo.PersonalBoardVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;

public interface PersonalBoardDao {

	public List<PersonalBoardVO> personalBoardList(PersonalBoardVO pbvo);

	public List<AdOrderListVO> pbReplyList(PbReplyVO pbrvo);

}
