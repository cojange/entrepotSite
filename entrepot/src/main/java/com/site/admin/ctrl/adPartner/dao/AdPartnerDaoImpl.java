package com.site.admin.ctrl.adPartner.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;
import com.site.admin.ctrl.adPartner.vo.MagazinePartnerVO;

@Repository
public class AdPartnerDaoImpl implements AdPartnerDao {
	
	@Autowired 
	private SqlSession session;
	
	//잡지 거래처 리스트
	@Override
	public List<CourierPartnerVO> couPartnerList(CourierPartnerVO cpvo) {
		return session.selectList("couPartnerList", cpvo);
	}

	//택배 거래처 리스트
	@Override
	public List<MagazinePartnerVO> magPartnerList(MagazinePartnerVO mpvo) {
		return session.selectList("magPartnerList", mpvo);
	}
	
	//잡지 거래처 등록
	@Override
	public int magazineInsert(MagazinePartnerVO mpvo) {
		return session.insert("magazineInsert", mpvo);
	}

	@Override
	public int courierInsert(CourierPartnerVO cpvo) {
		return session.insert("courierInsert", cpvo);
	}

	@Override
	public int magUpdate(MagazinePartnerVO mpvo) {
		return session.update("magUpdate", mpvo);
	}

	@Override
	public int closedMagInsert(MagazinePartnerVO mpvo) {
		return session.insert("magUpdate", mpvo);
	}

	@Override
	public MagazinePartnerVO magPartnerData(MagazinePartnerVO mpvo) {
		return (MagazinePartnerVO)session.selectOne("magPartnerData", mpvo);
	}
}
