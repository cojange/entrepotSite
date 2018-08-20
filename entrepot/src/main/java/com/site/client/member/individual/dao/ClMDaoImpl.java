package com.site.client.member.individual.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.member.individual.vo.ClMVO;

@Repository
public class ClMDaoImpl implements ClMDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public ClMVO memberSelect(String userId) {
		return session.selectOne("memberSelect",userId);
	}

}
