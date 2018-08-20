package com.site.admin.ctrl.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdMemberDaoImpl implements AdMemberDao{
	
	private SqlSession session;
}
