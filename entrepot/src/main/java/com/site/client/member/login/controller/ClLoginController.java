package com.site.client.member.login.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.site.client.member.login.service.ClLoginService;
import com.site.client.member.login.vo.LoginVO;

@Controller
@SessionAttributes("login")
@RequestMapping(value="/client")
public class ClLoginController{

	private Logger logger = Logger.getLogger(ClLoginController.class);
	@Autowired
	private ClLoginService clLoginService;
	
	@ModelAttribute("login")
	public LoginVO login() {
	return new LoginVO();
	}
	/**************************************************************
	* 로그인 폼 처리
	**************************************************************/
	@RequestMapping(value="/member/login.do",method = RequestMethod.GET)
	public String memberForm(){
		logger.info("login.do get 방식에 의한 메서드 호출 성공");
		return "client/login/login";
	}
	
	/**************************************************************
	* 로그인 처리 메서드
	**************************************************************/
	@RequestMapping(value="/member/login.do", method = RequestMethod.POST)
	public ModelAndView loginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav, HttpServletRequest request) {
	logger.info("login.do post 호출 성공");
	
	return mav;
	}
	

}
