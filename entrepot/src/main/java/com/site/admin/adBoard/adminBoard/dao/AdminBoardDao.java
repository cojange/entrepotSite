package com.site.admin.adBoard.adminBoard.dao;

import java.util.List;

import com.site.admin.adBoard.adminBoard.vo.AdminBoardVO;
import com.site.admin.adBoard.adminBoard.vo.CouponVO;

public interface AdminBoardDao {

	List<AdminBoardVO> adminBoardList(AdminBoardVO advo);

	List<CouponVO> couponList(CouponVO cvo);

}
