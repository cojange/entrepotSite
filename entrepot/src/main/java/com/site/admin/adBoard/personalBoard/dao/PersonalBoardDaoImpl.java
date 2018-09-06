package com.site.admin.adBoard.personalBoard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.adBoard.personalBoard.vo.PbReplyVO;
import com.site.admin.adBoard.personalBoard.vo.PersonalBoardVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;

@Repository
public class PersonalBoardDaoImpl implements PersonalBoardDao {
	
	@Autowired
	private SqlSession session;
	
	//1:1게시판 리스트
	@Override
	public List<PersonalBoardVO> personalBoardList(PersonalBoardVO pbvo) {
		return session.selectList("personalBoardList", pbvo);
	}

	@Override
	public List<AdOrderListVO> pbReplyList(PbReplyVO pbrvo) {
		return session.selectList("pbReplyList", pbrvo);
	}
}
