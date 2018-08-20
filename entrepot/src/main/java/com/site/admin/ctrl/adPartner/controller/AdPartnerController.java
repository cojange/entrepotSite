package com.site.admin.ctrl.adPartner.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.admin.ctrl.adPartner.service.AdPartnerService;
import com.site.admin.ctrl.adPartner.vo.CourierPartnerVO;
import com.site.admin.ctrl.adPartner.vo.MagazinePartnerVO;

@Controller
@RequestMapping(value="/admin")
public class AdPartnerController {
	Logger logger = Logger.getLogger(AdPartnerController.class);
	
	@Autowired
	private AdPartnerService adPartnerService;
	
	/** 
	 * 거래처 리스트 구현하기
	 *  **/
	@RequestMapping(value="/ctrl/adPartnerListCtrl.do", method=RequestMethod.GET)
	public String adPartnerList(CourierPartnerVO cpvo, MagazinePartnerVO mpvo, Model model) {
		logger.info("adPartnerList 호출 성공");
		
		List<CourierPartnerVO> couPartnerList = adPartnerService.couPartnerList(cpvo);
		model.addAttribute("couPartnerList", couPartnerList);
		
		/*List<MagazinePartnerVO> magPartnerList = adPartnerService.magPartnerList(mpvo);
		model.addAttribute("magPartnerList", magPartnerList);*/
		
		
		return "admin/ctrl/adPartnerListCtrl";
		
		
	}
}
