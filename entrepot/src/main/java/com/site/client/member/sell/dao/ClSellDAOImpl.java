package com.site.client.member.sell.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClSellDAOImpl implements ClSellDAO {
	
	@Autowired
	private SqlSession session;

}
