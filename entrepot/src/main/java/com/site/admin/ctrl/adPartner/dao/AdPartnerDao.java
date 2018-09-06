package com.site.admin.ctrl.adPartner.dao;

import java.util.List; 

import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;
import com.site.admin.ctrl.adPartner.vo.MagazinePartnerVO;
import com.site.admin.magazine.adMagazine.vo.MagazineSearchVO;

public interface AdPartnerDao {

	public List<CourierPartnerVO> couPartnerList(CourierPartnerVO cpvo);
	public List<MagazinePartnerVO> magPartnerList(MagazinePartnerVO mpvo);
	public int magazineInsert(MagazinePartnerVO mpvo);
	public int courierInsert(CourierPartnerVO cpvo);
	public int magUpdate(MagazinePartnerVO mpvo);
	public int closedMagInsert(MagazinePartnerVO mpvo);
	public MagazinePartnerVO magPartnerData(MagazinePartnerVO mpvo);
	public List<MagazineSearchVO> magCodeList(MagazineSearchVO msvo);
	public int magCodeInsert(MagazineSearchVO msvo);

}
