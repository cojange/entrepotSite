package com.site.client.magazine.list.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.client.magazine.ditail.vo.MagazineVO;
import com.site.client.magazine.list.service.ListService;

@Controller
@RequestMapping(value="/client")
public class ListController {
	Logger logger = Logger.getLogger(ListController.class);
	@Autowired
	private ListService listService;
	
	@RequestMapping(value="/list/magazinelist.do",method = RequestMethod.GET)
	public String megazineList(@ModelAttribute("data") MagazineVO mvo,Model model){
		logger.info("magazinelist.do get 방식에 의한 메서드 호출 성공");
		
		//전체 레코드 구현
		List<MagazineVO> magazineList = listService.magazineList(mvo); 
		
		model.addAttribute("magazienlist",magazineList);
		model.addAttribute("mvo",mvo);
		return "client/magazine/magazinelist";
	}
	
	
	
}
