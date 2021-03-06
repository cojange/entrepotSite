package com.site.admin.ctrl.adMember.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.ctrl.adMember.vo.AdManagerVO;
import com.site.admin.ctrl.adMember.vo.AdMbCommonVO;
import com.site.admin.ctrl.adMember.vo.AdMbPersnalVO;
import com.site.admin.ctrl.adMember.vo.AdminVO;

@Repository
public class AdMemberDaoImpl implements AdMemberDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<AdManagerVO> adminList(AdManagerVO amvo) {
		return session.selectList("amdinList",amvo);
	}
	
	@Override
	public List<AdMbCommonVO> memberList(AdMbCommonVO amcvo){
		return session.selectList("memberList",amcvo);
	}

	@Override
	public List<AdMbCommonVO> pmList(AdMbCommonVO ambcvo) {
		return session.selectList("pmList",ambcvo);
	}

	@Override
	public List<AdMbCommonVO> gpList(AdMbCommonVO ambcvo) {
		return session.selectList("gpList",ambcvo);
	}

	@Override
	public AdminVO idCheck(AdminVO avo) {
		return session.selectOne("idCheck",avo);
	}
	
	@Override
	public AdminVO tellCheck(AdminVO avo) {
		return session.selectOne("tellCheck",avo);
	}
	
	@Override
	public AdminVO emailCheck(AdminVO avo) {
		return session.selectOne("emailCheck",avo);
	}

	@Override
	public int insertAdmin(AdminVO avo) {
		return session.insert("insertAdmin",avo);
	}

	@Override
	public int delAdmin(String ad_id) {
		return session.delete("delAdmin", ad_id);
	}
	
}
