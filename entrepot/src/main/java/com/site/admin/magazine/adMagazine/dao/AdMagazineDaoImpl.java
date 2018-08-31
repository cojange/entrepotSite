package com.site.admin.magazine.adMagazine.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.magazine.ditail.vo.MagazineVO;

@Repository
public class AdMagazineDaoImpl implements AdMagazineDao {
	@Autowired
	private SqlSession session;
	
	//상품 리스트 구현
	@Override
	public List<MagazineVO> adMagazineList(MagazineVO mvo) {
		return session.selectList("adMagazineList", mvo);
	}
}
