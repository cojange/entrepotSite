package com.site.admin.ctrl.adMember.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.site.admin.ctrl.adMember.service.AdMemberService;
import com.site.admin.ctrl.adMember.vo.AdManagerVO;

@Controller
@RequestMapping(value="/admin/ctrl/adMember")
public class AdMemberController {
   
   @Autowired
   private AdMemberService adMemberService;
   
   @RequestMapping(value="/adMemberCtrl.do")
   public ModelAndView adMemberCtr(AdManagerVO amvo) {
      ModelAndView mav = new ModelAndView();
      
      List<AdManagerVO> adminList=adMemberService.adminList(amvo);
      //관리자 리스트
      mav.addObject("adminList",adminList);
      mav.setViewName("admin/ctrl/adMember/adMemberCtrl");
      
      return mav;
   }
   
   @RequestMapping(value="/adminList.do")
   public ModelAndView adminList(AdManagerVO amvo) {
	      ModelAndView mav = new ModelAndView();
	      
	      List<AdManagerVO> adminList=adMemberService.adminList(amvo);
	      //관리자 리스트
	      mav.addObject("adminList",adminList);
	      mav.setViewName("admin/adMember/list/adminList");
	      
	      return mav;
	}
   
   @RequestMapping(value="/memberList.do")
   public ModelAndView memberList() {
	      ModelAndView mav = new ModelAndView();
	      
	      mav.setViewName("admin/adMember/list/memberList");
	      
	      return mav;
	}
   
}