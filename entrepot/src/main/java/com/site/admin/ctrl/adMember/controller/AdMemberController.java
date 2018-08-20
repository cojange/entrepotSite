package com.site.admin.ctrl.adMember.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.site.admin.ctrl.adMember.service.AdMemberService;
import com.site.admin.ctrl.adMember.vo.AdManagerVO;

@Controller
@RequestMapping(value="/admin/ctrl")
public class AdMemberController {
	
	@Autowired
	private AdMemberService adMemberService;
	
	@RequestMapping(value="/adMemberCtr.do")
	public ModelAndView adMemberCtr(AdManagerVO amvo) {
		ModelAndView mav = new ModelAndView();
		
		List<AdManagerVO> adminList=adMemberService.adminList(amvo);
		
		//관리자 리스트
		mav.addObject("adminList",adminList);
		mav.setViewName("adMember/adMemberCtrl");
		
		return mav;
	}
	
}
