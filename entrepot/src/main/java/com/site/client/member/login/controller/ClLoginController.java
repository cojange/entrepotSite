package com.site.client.member.login.controller;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
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
		
		String m_id = lvo.getM_id();
		int resultData = clLoginService.loginHistoryInsert(lvo);
	
		// 우선 아이디가 존재하는지 먼저 확인 작업 진행(1: 존재하지 않을 때)
		if(resultData==1){ 
			mav.addObject("status", 1);
			mav.setViewName("client/login/login"); 
			return mav; 
		} else { 
			LoginVO vo = clLoginService.loginHistorySelect(m_id);
			logger.info("최근 로그인 일시 : " + new SimpleDateFormat("YYYY-MM-dd").format(vo.getLastSuccessedLogin()));
			logger.info("retry(로그인 시도 횟수): "+vo.getRetry());
	
			// 로그인 시도횟수가 5회가 넘으면 30초간 로그인 잠금 
			if(vo.getRetry() >= 5 ) {
				
				if (new Date().getTime() - vo.getLastFailedLogin() < 10000) {
				mav.addObject("status", 6);   // 10초동안 로그인잠금 알림
				mav.setViewName("client/login/login"); 
				return mav; 
				
				} else {
					vo.setRetry(0);
					vo.setLastFailedLogin(0);
					clLoginService.loginHistoryUpdate(vo);
				}
			}
	
			LoginVO loginCheckResult = clLoginService.loginSelect(lvo.getM_id(), lvo.getM_pwd());
	
			// 로그인이 틀리면, 로그인 시도횟수를 1증가 시키고, 로그인 실패 시간을 DB에 업데이트 한다.  
			if(loginCheckResult == null){
				vo.setRetry(vo.getRetry()+1);
				vo.setLastFailedLogin(new Date().getTime());
				clLoginService.loginHistoryUpdate(vo);
			
				mav.addObject("retry",vo.getRetry());
				mav.addObject("status", 1);
				mav.setViewName("client/login/login");   
				
				return mav; 
			}
		// 로그인이 성공하면, 로그인 시도횟수를 0로 reset, 마지막으로 로그인 실패 시간 0으로 reset, 
		// 성공한 클라이언트 IP를 DB에 업데이트,로그인 성공시간 DB에 업데이트  
			else {
				vo.setRetry(0);
				vo.setLastFailedLogin(0);
				vo.setLastSuccessedLogin(new Date().getTime());
				vo.setClientIP(request.getRemoteAddr());
				clLoginService.loginHistoryUpdate(vo);
			
				//session.setAttribute("login", loginCheckResult);
				mav.addObject("login", loginCheckResult);
				mav.setViewName("client/login/login");
				return mav;
			}
		} 
	}
	/**************************************************************
	* 로그아웃 처리 메서드
	**************************************************************/
	@RequestMapping("/member/logout.do")
	public String logout(SessionStatus sessionStatus){
	sessionStatus.setComplete();
	return "redirect:/";
	}

}
