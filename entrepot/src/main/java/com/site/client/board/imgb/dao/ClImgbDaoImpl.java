package com.site.client.board.imgb.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClImgbDaoImpl implements ClImgbDao {

	@Autowired
	private SqlSession session;
	
	
}