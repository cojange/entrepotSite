package com.site.admin.adBoard.personalBoard.service;

import java.util.List;

import com.site.admin.adBoard.personalBoard.vo.PbReplyVO;
import com.site.admin.adBoard.personalBoard.vo.PersonalBoardVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;

public interface PersonalBoardService {

	public List<PersonalBoardVO> personalBoardList(PersonalBoardVO pbvo);

	public List<AdOrderListVO> pbReplyList(PbReplyVO pbrvo);

	public int pbReInsert(PbReplyVO pbrvo);

}
