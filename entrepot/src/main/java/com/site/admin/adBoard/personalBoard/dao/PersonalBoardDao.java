package com.site.admin.adBoard.personalBoard.dao;

import java.util.List;

import com.site.admin.adBoard.personalBoard.vo.PersonalBoardVO;

public interface PersonalBoardDao {

	public List<PersonalBoardVO> personalBoardList(PersonalBoardVO pbvo);

}
