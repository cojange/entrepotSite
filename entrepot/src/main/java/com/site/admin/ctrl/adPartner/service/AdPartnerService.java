package com.site.admin.ctrl.adPartner.service;

import java.util.List;

import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;
import com.site.admin.ctrl.adPartner.vo.MagazinePartnerVO;

public interface AdPartnerService {

	public List<CourierPartnerVO> couPartnerList(CourierPartnerVO cpvo);
	public List<MagazinePartnerVO> magPartnerList(MagazinePartnerVO mpvo);
	public int magazineInsert(MagazinePartnerVO mpvo);
	public int courierInsert(CourierPartnerVO cpvo);
	public int magUpdate(MagazinePartnerVO mpvo);
 
}
