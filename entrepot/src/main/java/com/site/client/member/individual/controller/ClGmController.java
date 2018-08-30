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

import com.site.client.member.individual.service.ClGmService;
import com.site.client.member.individual.vo.ClGmVO;
import com.site.client.member.login.vo.LoginVO;

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
	
	/**************************************************************
	  * 회원 수정 폼
	  **************************************************************/
	 @RequestMapping(value="member/groupModify.do", method = RequestMethod.GET) 
	 public ModelAndView memberModify(HttpSession session){
	 logger.info("groupModify.do get 방식에 의한 메서드 호출 성공");
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
	  ClGmVO cmvo = clGmService.groupMemberSelect(login.getM_id());
	  mav.addObject("member", cmvo);
	  mav.setViewName("client/member/groupModify"); 
	  return mav;
	 } 
}
