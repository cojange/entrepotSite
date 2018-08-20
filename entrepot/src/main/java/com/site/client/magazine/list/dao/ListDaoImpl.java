package com.site.client.magazine.list.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ListDaoImpl implements ListDao {
	@Autowired
	 private SqlSession sqlSession;
}
