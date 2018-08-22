package com.site.client.member.individual.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.member.individual.vo.ClMSecurity;
import com.site.client.member.individual.vo.ClMVO;

@Repository
public class ClMDaoImpl implements ClMDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public ClMVO memberSelect(String m_id) {
		return session.selectOne("memberSelect",m_id);
	}


	@Override
	public int memberInsert(ClMVO cmvo) {
		return session.insert("memberInsert",cmvo);
	}


	@Override
	public int securityInsert(ClMSecurity set) {
		return session.insert("securityInsert",set);
	}


	@Override
	public ClMSecurity securitySelect(String m_id) {
		return session.selectOne("securitySelect",m_id);
	}

}
