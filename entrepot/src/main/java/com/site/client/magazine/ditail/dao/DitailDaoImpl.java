package com.site.client.magazine.ditail.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class DitailDaoImpl implements DitailDao {
	@Autowired
	 private SqlSession sqlSession;
}
