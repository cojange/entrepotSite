package com.site.admin.adBoard.adminBoard.Service;

import java.util.List;

import com.site.admin.adBoard.adminBoard.vo.AdminBoardVO;
import com.site.admin.adBoard.adminBoard.vo.CouponVO;

public interface AdminBoardService {

	List<AdminBoardVO> adminBoardList(AdminBoardVO advo);

	List<CouponVO> couponList(CouponVO cvo);

}
