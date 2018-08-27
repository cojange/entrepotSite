package com.site.client.member.individual.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClGmDaoImpl implements ClGmDao {
	Logger logger = Logger.getLogger(ClMDaoImpl.class);
	
	@Autowired
	private SqlSession session;
}
