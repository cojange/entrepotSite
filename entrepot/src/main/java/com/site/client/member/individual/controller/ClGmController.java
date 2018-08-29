package com.site.client.member.individual.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.site.client.member.individual.service.ClGmService;
import com.site.client.member.individual.vo.ClGmVO;

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
	
	/***********************************************
	 * 사용자 사업자번호 중복 체크 메서드
	 * ********************************************/
	@ResponseBody
	@RequestMapping(value="member/gm_comConfirm.do",
			method = RequestMethod.POST)
	public String gm_comConfirm(@RequestParam("com_no")String com_no) {
		logger.info("gm_comConfirm 메서드 호출 성공");
		int result=clGmService.gm_comConfirm(com_no);
		return result+"";
	}
	/***********************************************
	 * 회원가입 정보입력후
	 * ********************************************/
	@RequestMapping(value="member/groupForm.do",
			method = RequestMethod.POST)
	public ModelAndView groupMemberSelect(ClGmVO cgmvo,ModelAndView mav) {
		logger.info("groupForm.do post 방식에 의한 메서드 호출 성공");
		
		clGmService.groupMemberInsert(cgmvo);
		mav.setViewName("client/member/joinsuccess");
		return mav;
	}
}
