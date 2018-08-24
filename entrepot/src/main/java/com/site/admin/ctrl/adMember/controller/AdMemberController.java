package com.site.admin.ctrl.adMember.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.site.admin.ctrl.adMember.service.AdMemberService;
import com.site.admin.ctrl.adMember.vo.AdManagerVO;
import com.site.admin.ctrl.adMember.vo.AdMbCommonVO;

@Controller
@RequestMapping(value="/admin/ctrl/adMember")
public class AdMemberController {
   
   @Autowired
   private AdMemberService adMemberService;
   
   //회원관리 탭
   @RequestMapping(value="/adMemberCtrl.do")
   public ModelAndView adMemberCtr(AdManagerVO amvo, AdMbCommonVO ambcvo) {
      ModelAndView mav = new ModelAndView();
      
      List<AdManagerVO> adminList=adMemberService.adminList(amvo);
      //관리자 리스트
      List<AdMbCommonVO> memberList=adMemberService.memberList(ambcvo);
      //회원리스트
      mav.addObject("adminList",adminList);
      mav.addObject("memberList",memberList);
      mav.setViewName("admin/ctrl/adMember/adMemberCtrl");
      
      return mav;
   }
   
   //관리자 조회
   @RequestMapping(value="/adminList.do")
   public ModelAndView adminList(AdManagerVO amvo) {
	      ModelAndView mav = new ModelAndView();
	      
	      List<AdManagerVO> adminList=adMemberService.adminList(amvo);
	      //관리자 리스트
 
	      mav.addObject("adminList",adminList);
	      mav.setViewName("admin/adMember/list/adminList");
	      
	      return mav;
	}
   //회원조회
   @RequestMapping(value="/memberList.do")
   public ModelAndView memberList(AdMbCommonVO ambcvo, String mbType) {
	      ModelAndView mav = new ModelAndView();
	      
	      List<AdMbCommonVO> memberList=adMemberService.memberList(ambcvo);
	      //회원리스트
	      mav.addObject("memberList",memberList);
	      mav.setViewName("admin/adMember/list/memberList");
	      
	      return mav;
	}
   
}