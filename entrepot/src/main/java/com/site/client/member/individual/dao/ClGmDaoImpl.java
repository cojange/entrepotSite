package com.site.client.member.individual.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.member.individual.vo.ClGmVO;
import com.site.client.member.individual.vo.ClMSecurity;
import com.site.client.member.individual.vo.ClMVO;



@Repository
public class ClGmDaoImpl implements ClMDao {
	Logger logger = Logger.getLogger(ClGmDaoImpl.class);
	
	@Autowired
	private SqlSession session;
	
	@Override
	public ClGmVO groupMemberSelect(String m_id) {
		return (ClGmVO)session.selectOne("groupMemberSelect",m_id);
	}
	
	@Override
	public ClGmVO groupComMemberSelect(String com_no) {
		return (ClGmVO)session.selectOne("groupComMemberSelect",com_no);
	}
	
	@Override
	public int groupMemberInsert(ClGmVO cgmvo) {
		logger.info("groupMemberInsert 실행");
		return session.insert("groupMemberInsert",cgmvo);
	}

	@Override
	public ClMVO memberSelect(String m_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int memberInsert(ClMVO cmvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int securityInsert(ClMSecurity set) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ClMSecurity securitySelect(String m_Id) {
		// TODO Auto-generated method stub
		return null;
	}


	

	

	
}
