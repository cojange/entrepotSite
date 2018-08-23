package com.site.client.member.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.member.login.vo.LoginVO;

@Repository
public class ClLoginDaoImpl implements ClLoginDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public LoginVO m_idSelect(String m_id) {
		return (LoginVO) session.selectOne("m_idSelect", m_id);
	}

	@Override
	public LoginVO loginSelect(LoginVO lvo) {
		return (LoginVO) session.selectOne("loginSelect", lvo);
	}

	@Override
	public int loginHistoryInsert(LoginVO lvo) {
		return session.insert("loginHistoryInsert", lvo);
	}

	@Override
	public int loginHistoryUpdate(LoginVO lvo) {
		return session.update("loginHistoryUpdate", lvo);
	}

	@Override
	public LoginVO loginHistorySelect(String m_id) {
		return (LoginVO) session.selectOne("loginHistorySelect", m_id);
	}

}
