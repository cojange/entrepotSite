package com.site.client.board.personal.dao;

import java.util.List;

import com.site.client.board.personal.vo.PersonalVO;

public interface PersonalDao {
	public List<PersonalVO> personalList(PersonalVO pvo);
	
public int personalInsert(PersonalVO pvo);
	
	public PersonalVO personalDetail(PersonalVO pvo);
	
	public int pwdConfirm(PersonalVO pvo);
	
	public int personalUpdate(PersonalVO pvo);
	
	public int personalDelete(int pb_no);

}
