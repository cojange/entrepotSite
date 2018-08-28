package com.site.admin.adBoard.adminBoard.Service;

import java.util.List;

import com.site.admin.adBoard.adminBoard.vo.AdminBoardVO;
import com.site.admin.adBoard.adminBoard.vo.CouponVO;

public interface AdminBoardService {

	public List<AdminBoardVO> adminBoardList(AdminBoardVO advo);

	public List<CouponVO> couponList(CouponVO cvo);

	public int couponInsert(CouponVO cvo);

	public int couponUpdate(CouponVO cvo);

}
