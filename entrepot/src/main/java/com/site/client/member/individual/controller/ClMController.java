package com.site.client.member.individual.controller;

import javax.servlet.http.HttpSession;

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
import com.site.client.member.login.vo.LoginVO;

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
	 * 사용자/단체 아이디 중복 체크 메서드
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
	
	/**************************************************************
	  * 회원 수정 폼
	  **************************************************************/
	 @RequestMapping(value="member/memberModify.do", method = RequestMethod.GET) 
	 public ModelAndView memberModify(HttpSession session){
	 logger.info("memberModify.do get 방식에 의한 메서드 호출 성공");
	 ModelAndView mav=new ModelAndView();
	 // session 객체에서 로그인 정보 얻기 
	 LoginVO login =(LoginVO)session.getAttribute("login");

	 // 추후 아래 부분에 대한 제어는 한곳에서 설정되도록 변경해 주면 된다 
	// 혹 로그인되어 있지 않으면 로그인 화면으로 이동.
	 if(login==null){
	 mav.setViewName("client/member/login"); 
	 return mav;
	 }
	  // 세션에서 로그인 정보 중 아이디만 가지고 해당 아이디에 대한 상세내역  DB에서 조회
	  ClMVO cvo = clMService.memberSelect(login.getM_id());
	  mav.addObject("member", cvo);
	  mav.setViewName("client/member/memberModify"); 
	  return mav;
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
