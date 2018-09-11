package com.site.admin.ctrl.adPartner.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;
import com.site.admin.ctrl.adPartner.vo.MagazinePartnerVO;
import com.site.admin.magazine.adMagazine.vo.MagazineSearchVO;
import com.site.client.magazine.ditail.vo.MagazineVO;

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

	//택배 거래처 등록
	@Override
	public int courierInsert(CourierPartnerVO cpvo) {
		return session.insert("courierInsert", cpvo);
	}
	
	//잡지거래처 수정
	@Override
	public int magUpdate(MagazinePartnerVO mpvo) {
		return session.update("magUpdate", mpvo);
	}
	
	//계약 만료 데이터 저장
	@Override
	public int closedMagInsert(MagazinePartnerVO mpvo) {
		return session.insert("magUpdate", mpvo);
	}
	
	//잡지 거래처 수정전 이전 계약기간 값 저장
	@Override
	public MagazinePartnerVO magPartnerData(MagazinePartnerVO mpvo) {
		return (MagazinePartnerVO)session.selectOne("magPartnerData", mpvo);
	}
	
	//잡지코드 리스트
	@Override
	public List<MagazineSearchVO> magCodeList(MagazineSearchVO msvo) {
		return session.selectList("magCodeList", msvo);
	}
	
	//잡지코드 등록
	@Override
	public int magCodeInsert(MagazineSearchVO msvo) {
		return session.insert("magCodeInsert", msvo);
	}
	
	//잡지코드 수정
	@Override
	public int magCodeUpdate(MagazineSearchVO msvo) {
		return session.update("magCodeUpdate", msvo);
	}
}
