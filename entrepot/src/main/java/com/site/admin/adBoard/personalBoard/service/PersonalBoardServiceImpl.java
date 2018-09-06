package com.site.admin.adBoard.personalBoard.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.adBoard.personalBoard.dao.PersonalBoardDao;
import com.site.admin.adBoard.personalBoard.vo.PbReplyVO;
import com.site.admin.adBoard.personalBoard.vo.PersonalBoardVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;

@Service
public class PersonalBoardServiceImpl implements PersonalBoardService{
	Logger logger = Logger.getLogger(PersonalBoardServiceImpl.class);
	
	@Autowired
	private PersonalBoardDao personalBoardDao;
	
	//1:1 게시판 리스트
	@Override
	public List<PersonalBoardVO> personalBoardList(PersonalBoardVO pbvo) {
		List<PersonalBoardVO> personalBoardList = null;
		
		personalBoardList = personalBoardDao.personalBoardList(pbvo);
		return personalBoardList;
	}
	
	//댓글 리스트
	@Override
	public List<AdOrderListVO> pbReplyList(PbReplyVO pbrvo) {
		List<AdOrderListVO> pbReplyList = personalBoardDao.pbReplyList(pbrvo);
		return pbReplyList;
	}
}
