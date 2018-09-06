package com.site.admin.ctrl.adPartner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.site.admin.ctrl.adPartner.service.AdPartnerService;
import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;
import com.site.admin.ctrl.adPartner.vo.MagazinePartnerVO;

@Controller
@RequestMapping(value="/admin/ctrl/adPartner")
public class AdPartnerController {
	Logger logger = Logger.getLogger(AdPartnerController.class);
	
	@Autowired
	private AdPartnerService adPartnerService;
	
	/** 
	 * 거래처 리스트 구현하기
	 *  **/
	@RequestMapping(value="/adPartnerListCtrl.do", method=RequestMethod.GET)
	public ModelAndView adPartnerList(CourierPartnerVO cpvo, MagazinePartnerVO mpvo) {
		logger.info("adPartnerList 호출 성공");
		ModelAndView mav = new ModelAndView();
		
		List<CourierPartnerVO> couPartnerList = adPartnerService.couPartnerList(cpvo);
		mav.addObject("couPartnerList", couPartnerList);

		List<MagazinePartnerVO> magPartnerList = adPartnerService.magPartnerList(mpvo);
		mav.addObject("magPartnerList", magPartnerList);
		mav.setViewName("admin/ctrl/adPartner/adPartnerListCtrl");
		
		return mav;
	}
	
	/** 
	 * 잡지 거래처 등록 불러오기  --> 모달로 변경
	 *  **/
	/*@RequestMapping(value="/magazineForm.do")
	public String magazineForm() {
		logger.info("magazineForm 호출 성공");
		
		return "admin/writeForm/magazineForm";
	}*/
	
	/** 
	 * 잡지 거래처 등록 구현하기
	 *  **/
	@RequestMapping(value="/magazineInsert.do", method=RequestMethod.POST)
	public String magazineInsert(MagazinePartnerVO mpvo, Model model) {
		logger.info("magazineInsert 호출 성공");
		
		int result = 0;
		String url="";
		
		result = adPartnerService.magazineInsert(mpvo);
		
		if(result == 1) {  //오류가 발생하지 않은 경우
			url = "/admin/ctrl/adPartner/adPartnerListCtrl.do";
		}else {  //오류가 발생한 경우
			model.addAttribute("code", 1);  //오류 내용
			url = "/admin/ctrl/adPartner/magazineInsert.do"; 
		}
		return "redirect:"+url;
	}
	
	/** 
	 * 택배 거래처 등록 구현하기
	 *  **/
	@RequestMapping(value="/courierInsert.do", method=RequestMethod.POST)
	public String courierInsert(CourierPartnerVO cpvo, Model model) {
		logger.info("courierInsert 호출 성공");
		 
		int result = 0;
		String url="";
		
		result = adPartnerService.courierInsert(cpvo);
		
		if(result == 1) {  //오류가 발생하지 않은 경우
			url = "/admin/ctrl/adPartner/adPartnerListCtrl.do";
		}else {  //오류가 발생한 경우
			model.addAttribute("code", 1);  //오류 내용
			url = "/admin/ctrl/adPartner/courierInsert.do"; 
		}
		return "redirect:"+url;
	}
	
	/** 
	 * 잡지 거래처 수정 구현하기
	 *  **/
	@RequestMapping(value="/magUpdate.do", method=RequestMethod.POST)
	public String magUpdate(MagazinePartnerVO mpvo, Model model, HttpServletRequest request) throws IOException {
		logger.info("magUpdate 호출 성공");
		
		int result = 0;
		result = adPartnerService.magUpdate(mpvo);
		String url ="";
		
		if(result ==2) {
			url = "/admin/ctrl/adPartner/adPartnerListCtrl.do";
		}else {
			url = "/admin/ctrl/adPartner/magazineInsert.do";
		}
		return "redirect:" + url;
	} 
}
