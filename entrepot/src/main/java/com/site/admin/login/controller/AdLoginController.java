package com.site.admin.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.site.admin.ctrl.adMember.vo.AdminVO;
import com.site.admin.login.service.AdLoginService;

@Controller
@SessionAttributes("adlogin")
@RequestMapping(value="/adLogin")
public class AdLoginController {
	
	@Autowired
	private AdLoginService adLoginService;
	
	@ModelAttribute("adlogin")
	public AdminVO login() {
		return new AdminVO();
	}
	
	//로그인 폼
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String loginForm() {
		return "admin/adLogin";
	}
	
	//로그인 처리 (실패횟수 제한 no..)
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView loginInsert(@ModelAttribute AdminVO avo, ModelAndView mav) {
		
		String ad_id = avo.getAd_id();
		String ad_pw = avo.getAd_pw();
		
		AdminVO loginCheck = adLoginService.loginSelect(ad_id, ad_pw);
		
		if(loginCheck == null) {
			System.out.println("실패");
			mav.addObject("status",1);
			mav.setViewName("/admin/adLogin");
		}else {
			mav.addObject("adlogin",loginCheck);
			mav.setViewName("redirect:/admin");
		}
		
		return mav;
		
	}
	
	//로그아웃
	@RequestMapping(value="/logout.do")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return loginForm();
	}
	
}
