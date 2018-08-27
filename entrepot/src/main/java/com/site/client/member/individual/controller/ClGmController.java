package com.site.client.member.individual.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.client.member.individual.service.ClGmService;

@Controller
@RequestMapping(value="/client")
public class ClGmController {
	
	Logger logger = Logger.getLogger(ClMController.class);
	
	@Autowired
	private ClGmService clGmService;
	

	/***********************************************
	 * 회원가입폼
	 * ********************************************/
	@RequestMapping(value="member/groupForm.do",method = RequestMethod.GET)
	public String groupMemberForm(){
		logger.info("groupForm.do get 방식에 의한 메서드 호출 성공");
		return "client/member/groupForm";
	}
}
