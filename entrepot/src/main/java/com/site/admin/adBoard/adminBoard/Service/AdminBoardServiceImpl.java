package com.site.admin.adBoard.adminBoard.Service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.adBoard.adminBoard.dao.AdminBoardDao;
import com.site.admin.adBoard.adminBoard.vo.AdminBoardVO;
import com.site.admin.adBoard.adminBoard.vo.CouponVO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService{
	Logger logger = Logger.getLogger(AdminBoardServiceImpl.class);
	
	@Autowired
	private AdminBoardDao adminBoardDao;
	
	//공지사항, 이벤트 게시판 리스트
	@Override
	public List<AdminBoardVO> adminBoardList(AdminBoardVO advo) {
		List<AdminBoardVO> adminBoardList = null;
		
		adminBoardList = adminBoardDao.adminBoardList(advo);
		return adminBoardList;
	}
	
	//쿠폰 리스트
	@Override
	public List<CouponVO> couponList(CouponVO cvo) {
		List<CouponVO> couponList= null;
		
		couponList = adminBoardDao.couponList(cvo);
		return couponList;
	}

	//쿠폰 등록
	@Override
	public int couponInsert(CouponVO cvo) {
		int result = 0;
		try {
			result = adminBoardDao.couponInsert(cvo);
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;
	}

}
