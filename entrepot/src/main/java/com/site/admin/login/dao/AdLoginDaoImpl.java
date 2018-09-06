package com.site.admin.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.ctrl.adMember.vo.AdminVO;

@Repository
public class AdLoginDaoImpl implements AdLoginDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public AdminVO loginSelect(AdminVO secvo) {
		return (AdminVO) session.selectOne("loginSelect",secvo);
	}

}
