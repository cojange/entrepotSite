package com.site.admin.adBoard.personalBoard.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.admin.adBoard.personalBoard.service.PersonalBoardService;
import com.site.admin.adBoard.personalBoard.vo.PersonalBoardVO;

@Controller
@RequestMapping(value="/admin/adBoard/personalBoard")
public class PersonalBoardController {
	Logger logger = Logger.getLogger(PersonalBoardController.class);
	
	@Autowired
	private PersonalBoardService personalBoardService;
	
	/**
	 * 1:1 게시판 리스트 구현하기
	 * **/
	@RequestMapping(value="/personalBoardList.do", method=RequestMethod.GET)
	public String personalBoardList(PersonalBoardVO pbvo, Model model) {
		logger.info("personalBoardList 호출 성공");
		
		List<PersonalBoardVO> personalBoardList = personalBoardService.personalBoardList(pbvo);
		model.addAttribute("personalBoardList", personalBoardList);
		
		return "admin/adBoard/personalBoard/personalBoardList";
	}
	
}