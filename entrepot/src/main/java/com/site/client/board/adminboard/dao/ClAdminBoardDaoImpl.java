package com.site.client.board.adminboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.board.adminboard.vo.ClAdminBoardVO;
@Repository
public class ClAdminBoardDaoImpl implements ClAdminBoardDao {
	@Autowired
	private SqlSession session;
	@Override
	public List<ClAdminBoardVO> adminboardList(ClAdminBoardVO advo) {
		// TODO Auto-generated method stub
		return session.selectList("adminboardList", advo);
	}
	@Override
	public ClAdminBoardVO adminboardDetail(ClAdminBoardVO cavo) {
		// TODO Auto-generated method stub
		return session.selectOne("adminboardDetail", cavo);
	}
	

}
