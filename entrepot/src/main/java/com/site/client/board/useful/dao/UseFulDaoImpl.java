package com.site.client.board.useful.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.board.useful.vo.UsefulVO;

@Repository
public class UseFulDaoImpl implements UseFulDao{
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<UsefulVO> usefulList(UsefulVO uvo) {
		// TODO Auto-generated method stub
		return session.selectList("usefulList", uvo);
	}

	@Override
	public UsefulVO usefulDetail(UsefulVO uvo) {
		// TODO Auto-generated method stub
		return session.selectOne("usefulDetail", uvo);
	}

}
