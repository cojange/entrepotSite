package com.site.admin.ctrl.adPartner.dao;

import java.util.List; 

import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;

public interface AdPartnerDao {

	public List<CourierPartnerVO> couPartnerList(CourierPartnerVO cpvo);

}
