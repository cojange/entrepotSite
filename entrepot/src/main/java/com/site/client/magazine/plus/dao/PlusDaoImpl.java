package com.site.client.magazine.plus.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;



import com.site.client.magazine.plus.vo.PlusVO;


public class PlusDaoImpl implements PlusDao {
	@Autowired
	 private SqlSession sqlSession;

	@Override
	public List<PlusVO> plusList(String pd_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("plusList",pd_num);
	}

	@Override
	public int pluschoice(PlusVO av) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("pluschoice",av);
	}

	@Override
	public int pluschoice2(PlusVO av) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("pluschoice2",av);
	}
}
