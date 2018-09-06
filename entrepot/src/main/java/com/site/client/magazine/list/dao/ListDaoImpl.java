package com.site.client.magazine.list.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.magazine.ditail.vo.MagazineVO;
import com.site.client.member.myPage.vo.ClMyPageVO;
@Repository
public class ListDaoImpl implements ListDao {
	@Autowired
	 private SqlSession sqlSession;
	@Override
	public List<MagazineVO> magazineList(MagazineVO mvo) {	
		return sqlSession.selectList("magazineList",mvo);
	}
	@Override
	public int listcount(MagazineVO mvo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("listcount", mvo);
	}

	@Override
	public List<MagazineVO> bastlist(MagazineVO mvo){
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("bastlist", mvo);
	}
	@Override
	public List<MagazineVO> jlist(MagazineVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("jlist",mvo);
	}
	@Override
	public List<MagazineVO> elist(MagazineVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("elist", mvo);
	}
	@Override
	public List<MagazineVO> aplist(MagazineVO mvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("aplist", mvo);
	}
	@Override
	public int cardcheck(ClMyPageVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cardcheck", pvo);
	}
	@Override
	public int cardinsert(ClMyPageVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("cardinsert",pvo);
	}
	@Override
	public int cardupdate(ClMyPageVO pvo) {
		// TODO Auto-generated method stub
		return sqlSession.update("cardupdate",pvo);
	}
	
	
}
