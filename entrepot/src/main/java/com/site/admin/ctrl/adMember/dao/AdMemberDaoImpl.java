package com.site.admin.ctrl.adMember.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.ctrl.adMember.vo.AdManagerVO;

@Repository
public class AdMemberDaoImpl implements AdMemberDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<AdManagerVO> adminList(AdManagerVO amvo) {
		return session.selectList("amdinList",amvo);
	}
}
