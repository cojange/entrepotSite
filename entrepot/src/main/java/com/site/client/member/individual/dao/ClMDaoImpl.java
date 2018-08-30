package com.site.client.member.individual.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.member.individual.controller.ClMController;
import com.site.client.member.individual.vo.ClGmVO;
import com.site.client.member.individual.vo.ClMSecurity;
import com.site.client.member.individual.vo.ClMVO;

@Repository
public class ClMDaoImpl implements ClMDao {
	
	Logger logger = Logger.getLogger(ClMDaoImpl.class);
	
	@Autowired
	private SqlSession session;

	@Override
	public ClMVO memberSelect(String m_id) {
		return (ClMVO)session.selectOne("memberSelect",m_id);
	}
	
	@Override
	public int memberUpdate(ClMVO  cvo) {
	return session.update("memberUpdate", cvo);
	}

	@Override
	public int memberInsert(ClMVO cmvo) {
		logger.info("memberInsert 실행");
		return session.insert("memberInsert",cmvo);
	}


	@Override
	public int securityInsert(ClMSecurity set) {
		logger.info("securityInsert 실행");
		return session.insert("securityInsert",set);
	}


	@Override
	public ClMSecurity securitySelect(String m_id) {
		return (ClMSecurity)session.selectOne("securitySelect",m_id);
	}

	/*****************인터페이스 공용사용으로인한재정의*******************/
	@Override
	public ClGmVO groupMemberSelect(String m_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int groupMemberInsert(ClGmVO cmvo) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public ClGmVO groupComMemberSelect(String com_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int groupMemberUpdate(ClGmVO cmvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
