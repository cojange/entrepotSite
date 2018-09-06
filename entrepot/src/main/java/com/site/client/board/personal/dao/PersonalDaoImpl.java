package com.site.client.board.personal.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.board.personal.vo.PersonalVO;


@Repository
public class PersonalDaoImpl implements PersonalDao{
	
	@Autowired
	private SqlSession session;

	@Override
	public List<PersonalVO> personalList(PersonalVO pvo) {
		// TODO Auto-generated method stub
		return session.selectList("personalList",pvo);
	}

	@Override
	public int personalInsert(PersonalVO pvo) {
		// TODO Auto-generated method stub
		return session.insert("personalInsert", pvo);
	}

	@Override
	public PersonalVO personalDetail(PersonalVO pvo) {
		// TODO Auto-generated method stub
		return (PersonalVO)session.selectOne("personalDetail", pvo);
	}

	@Override
	public int pwdConfirm(PersonalVO pvo) {
		// TODO Auto-generated method stub
		return (Integer)session.selectOne("pwdConfirm", pvo);
	}

	@Override
	public int personalUpdate(PersonalVO pvo) {
		// TODO Auto-generated method stub
		return session.update("personalUpdate", pvo);
	}

	@Override
	public int personalDelete(int pb_no) {
		// TODO Auto-generated method stub
		return session.delete("personalDelete", pb_no);
	}

}
