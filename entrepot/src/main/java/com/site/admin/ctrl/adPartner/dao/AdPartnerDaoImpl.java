package com.site.admin.ctrl.adPartner.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;

@Repository
public class AdPartnerDaoImpl implements AdPartnerDao {
	
	@Autowired 
	private SqlSession session;

	@Override
	public List<CourierPartnerVO> couPartnerList(CourierPartnerVO cpvo) {
		return session.selectList("couPartnerList", cpvo);
	}
}
