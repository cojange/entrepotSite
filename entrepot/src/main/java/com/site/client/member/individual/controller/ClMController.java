package com.site.client.member.individual.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.site.client.member.individual.service.ClMService;
import com.site.client.member.individual.vo.ClMVO;

@Controller
@RequestMapping(value="/client")
public class ClMController{
	Logger logger = Logger.getLogger(ClMController.class);
	
	@Autowired
	private ClMService clMService;
	
	/***********************************************
	 * 회원가입폼
	 * ********************************************/
	@RequestMapping(value="member/mForm.do",method = RequestMethod.GET)
	public String memberForm(){
		logger.info("mForm.do get 방식에 의한 메서드 호출 성공");
		return "client/member/mForm";
	}
	
	/***********************************************
	 * 사용자 아이디 중복 체크 메서드
	 * ********************************************/
	@ResponseBody
	@RequestMapping(value="member/m_idConfirm.do",
			method = RequestMethod.POST)
	public String m_idConfirm(@RequestParam("m_id")String m_id) {
		logger.info("m_idConfirm 메서드 호출 성공");
		int result=clMService.m_idConfirm(m_id);
		return result+"";
	}
	
	/***********************************************
	 * 회원가입 정보입력후
	 * ********************************************/
	@RequestMapping(value="member/mForm.do",
			method = RequestMethod.POST)
	public ModelAndView memberInsert(ClMVO cmvo,ModelAndView mav) {
		logger.info("mForm.do post 방식에 의한 메서드 호출 성공");
		
		clMService.memberInsert(cmvo);
		mav.setViewName("client/member/joinsuccess");
		return mav;
	}
	
	/***********************************************
	 * 회원가입 선택폼
	 * ********************************************/
	@RequestMapping(value="member/mChoose.do",method = RequestMethod.GET)
	public String mChoose(){
		logger.info("mChoose.do  메서드 호출 성공");
		return "client/member/memberChoose";
	}
	
	/***********************************************
	 * 14세미만 회원가입 보호자인증폼
	 * ********************************************/
	@RequestMapping(value="member/guardian.do",method = RequestMethod.GET)
	public String guardianForm(){
		logger.info("guardian.do  메서드 호출 성공");
		return "client/member/guardianForm";
	}

}
