package com.site.client.member.myPage.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.client.member.login.controller.ClLoginController;
import com.site.client.member.myPage.service.ClMyPageService;


@Controller
@RequestMapping(value="/client")
public class ClMyPageController {
	
	private Logger logger = Logger.getLogger(ClLoginController.class);
	@Autowired
	private ClMyPageService clMyPageService;
	
	/**************************************************************
	* 로그인 폼 처리
	**************************************************************/
	@RequestMapping(value="/member/myPage.do",method = RequestMethod.GET)
	public String myPage(){
		logger.info("myPage 메서드 호출 성공");
		return "client/member/myPage/body/myPage";
	}

}
