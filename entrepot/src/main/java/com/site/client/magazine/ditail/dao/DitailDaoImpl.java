package com.site.client.magazine.ditail.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.site.client.magazine.ditail.vo.MagazineVO;

public class DitailDaoImpl implements DitailDao {
	@Autowired
	 private SqlSession sqlSession;

	@Override
	public MagazineVO magazineDetail(MagazineVO mvo) {

		return sqlSession.selectOne("magazineDetail",mvo);
	}

	@Override
	public List<MagazineVO> magazinesum(MagazineVO magazine) {
		return sqlSession.selectList("magazinesum", magazine);
	}

	@Override
	public MagazineVO magazineDetailfree(MagazineVO magazine) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("magazineDetailfree",magazine);
	}
}
