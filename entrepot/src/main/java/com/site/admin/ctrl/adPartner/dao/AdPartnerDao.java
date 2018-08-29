package com.site.admin.ctrl.adPartner.dao;

import java.util.List; 

import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;
import com.site.admin.ctrl.adPartner.vo.MagazinePartnerVO;

public interface AdPartnerDao {

	public List<CourierPartnerVO> couPartnerList(CourierPartnerVO cpvo);
	public List<MagazinePartnerVO> magPartnerList(MagazinePartnerVO mpvo);
	public int magazineInsert(MagazinePartnerVO mpvo);

}
