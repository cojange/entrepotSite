package com.site.admin.adBoard.adminBoard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.adBoard.adminBoard.vo.AdminBoardVO;
import com.site.admin.adBoard.adminBoard.vo.CouponVO;

@Repository
public class AdminBoardDaoImpl implements AdminBoardDao {
	
	@Autowired
	private SqlSession session;
	
	//공지사항, 이벤트 게시판 리스트
	@Override
	public List<AdminBoardVO> adminBoardList(AdminBoardVO advo) {
		return session.selectList("adminBoardList", advo);
	}
	
	//쿠폰 리스트
	@Override
	public List<CouponVO> couponList(CouponVO cvo) {
		return session.selectList("couponList", cvo);
	}

	//쿠폰 등록
	@Override
	public int couponInsert(CouponVO cvo) {
		return session.insert("couponInsert", cvo);
	}

}
