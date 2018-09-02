package com.site.admin.magazine.adMagazine.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.admin.magazine.adMagazine.service.AdMagazineService;
import com.site.client.magazine.ditail.vo.MagazineVO;

@Controller
@RequestMapping(value="admin/magazine/adMagazine")
public class AdMagazineController {
	Logger logger = Logger.getLogger(AdMagazineController.class);
	
	@Autowired
	private AdMagazineService adMagazineService;
	
	/**
	 * 상품 리스트 구현하기
	 * **/	
	@RequestMapping(value="adMagazineList.do", method=RequestMethod.GET)
	public String adMagazineList(MagazineVO msvo, Model model) {
		logger.info("adMagazineList 호출 성공");		
		
		List<MagazineVO> adMagazineList = adMagazineService.adMagazineList(msvo);
		model.addAttribute("adMagazineList", adMagazineList);
		
		System.out.println(adMagazineList.toString());
		
		return "admin/magazine/adMagazine/adMagazineList";
	}
}
