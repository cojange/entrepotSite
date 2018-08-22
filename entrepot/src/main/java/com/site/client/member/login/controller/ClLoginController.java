package com.site.client.member.login.controller;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/client")
public class ClLoginController{

	private Logger logger = Logger.getLogger(ClLoginController.class);
	
	@RequestMapping(value="/login/login.do",method = RequestMethod.GET)
	public String memberForm(){
		logger.info("login.do get 방식에 의한 메서드 호출 성공");
		return "client/login/login";
	}
	
	

}
