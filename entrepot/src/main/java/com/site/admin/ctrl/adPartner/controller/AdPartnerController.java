package com.site.admin.ctrl.adPartner.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
<<<<<<< HEAD
		mav.setViewName("admin/adPartner/adPartnerListCtrl");
=======
		mav.setViewName("/admin/crtl/adPartner/adPartnerListCtrl");
>>>>>>> branch 'master' of https://github.com/cojange/entrepotSite.git
		
		
		/*List<MagazinePartnerVO> magPartnerList = adPartnerService.magPartnerList(mpvo);
		mav.addObject("magPartnerList", magPartnerList);*/
		
		
		return mav;
		
		
	}
}
