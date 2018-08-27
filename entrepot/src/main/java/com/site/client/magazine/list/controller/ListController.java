package com.site.client.magazine.list.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.client.magazine.ditail.vo.MagazineVO;

import com.site.client.magazine.list.service.ListService;

@Controller
@RequestMapping(value="/client/list")
public class ListController {
	Logger logger = Logger.getLogger(ListController.class);
	@Autowired
	private ListService listService;
	
	@RequestMapping(value="/magazinelist.do",method = RequestMethod.GET)
	public String megazineList(@ModelAttribute("data") MagazineVO mvo,Model model){
		logger.info("magazinelist.do get 방식에 의한 메서드 호출 성공");
		logger.info("listkey:" +mvo.getListkey());
		logger.info("key1:" +mvo.getKey1());
		logger.info("key2:" +mvo.getKey2());
		logger.info("key3:"+mvo.getKey3());
		
		
		//전체 레코드 구현
		List<MagazineVO> magazineList = listService.magazineList(mvo); 
		
	

		model.addAttribute("magazienlist",magazineList);
		model.addAttribute("mvo",mvo);
		return "client/magazine/magazinelist";
	}
	
	
	
}
