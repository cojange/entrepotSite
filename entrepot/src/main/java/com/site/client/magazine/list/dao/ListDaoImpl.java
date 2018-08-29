package com.site.client.magazine.list.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.magazine.ditail.vo.MagazineVO;
@Repository
public class ListDaoImpl implements ListDao {
	@Autowired
	 private SqlSession sqlSession;
	@Override
	public List<MagazineVO> magazineList(MagazineVO mvo) {	
		return sqlSession.selectList("magazineList",mvo);
	}

	
}
