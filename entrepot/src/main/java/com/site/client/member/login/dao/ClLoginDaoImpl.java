package com.site.client.member.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.member.individual.vo.ClMVO;

@Repository
public class ClLoginDaoImpl implements ClLoginDao {
	
	@Autowired
	private SqlSession session;

}
