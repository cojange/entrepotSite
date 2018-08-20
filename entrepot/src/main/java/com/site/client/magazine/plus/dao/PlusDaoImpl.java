package com.site.client.magazine.plus.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public class PlusDaoImpl implements PlusDao {
	@Autowired
	 private SqlSession sqlSession;
}
