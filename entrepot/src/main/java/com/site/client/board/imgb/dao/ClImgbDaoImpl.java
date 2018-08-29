package com.site.client.board.imgb.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.board.imgb.vo.ClImgbVO;


@Repository
public class ClImgbDaoImpl implements ClImgbDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<ClImgbVO> clImgbList(ClImgbVO cvo) {
		// TODO Auto-generated method stub
		return session.selectList("clImgbList",cvo);
	}

	@Override
	public int imgbInsert(ClImgbVO cvo) {
		// TODO Auto-generated method stub
		return session.insert("imgbInsert", cvo);
	}

	@Override
	public ClImgbVO imgbDetail(ClImgbVO cvo) {
		// TODO Auto-generated method stub
		return session.selectOne("imgbDetail", cvo);
	}
	
	
}
