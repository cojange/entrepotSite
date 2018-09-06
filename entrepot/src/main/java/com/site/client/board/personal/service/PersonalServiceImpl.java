package com.site.client.board.personal.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.board.personal.dao.PersonalDao;
import com.site.client.board.personal.vo.PersonalVO;


@Service
public class PersonalServiceImpl implements PersonalService {
	Logger logger = Logger.getLogger(PersonalServiceImpl.class);
	
	@Autowired
	private PersonalDao personalDao;

	@Override
	public List<PersonalVO> personalList(PersonalVO pvo) {
		List<PersonalVO> myList = null;
		if(pvo.getSearch()=="") {
			pvo.setSearch("all");
		}
		myList = personalDao.personalList(pvo);
		return myList;
	}

	@Override
	public int personalInsert(PersonalVO pvo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = personalDao.personalInsert(pvo);
		}catch(Exception e) {
			System.out.println("글입력 오류");
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public PersonalVO personalDetail(PersonalVO pvo) {
		// TODO Auto-generated method stub
		PersonalVO detail = null;
		detail = personalDao.personalDetail(pvo);
		return detail;
	}
	//비밀번호체크
	@Override
	public int pwdConfirm(PersonalVO pvo) {
		// TODO Auto-generated method stub
		int pwd = 0;
		pwd= personalDao.pwdConfirm(pvo);
		return pwd;
	}

	@Override
	public int personalUpdate(PersonalVO pvo) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = personalDao.personalUpdate(pvo);
		}catch(Exception e) {
			System.out.println("수정오류");
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int personalDelete(int pb_no) {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = personalDao.personalDelete(pb_no);
		}catch(Exception e) {
			System.out.println("삭제오류");
			e.printStackTrace();
		}
		return result;
	}

	/*@Override
	public int replyList(int re_no) {
		int list = personalDao.replyList(re_no);
		return list;
	}*/
}
