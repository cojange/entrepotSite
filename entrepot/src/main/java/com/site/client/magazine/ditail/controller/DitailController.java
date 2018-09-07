package com.site.client.magazine.ditail.controller;


import java.util.List;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.client.magazine.ditail.service.DitailService;
import com.site.client.magazine.ditail.vo.MagazineVO;

@Controller
@RequestMapping(value="/client/ditail")
public class DitailController {
	Logger logger = Logger.getLogger(DitailController.class);
	@Autowired
	private DitailService ditailService;
	
	@RequestMapping(value="/magazineDetail.do" ,method=RequestMethod.GET)
	public String magazineDetail(@ModelAttribute("data")MagazineVO mvo,Model model)  {
		
		MagazineVO magazine = new MagazineVO();
		magazine = ditailService.magazineDetail(mvo);
		List<MagazineVO> list= ditailService.magazinesum(magazine);
		List<MagazineVO> free = ditailService.magazineDetailfree(magazine);
		
		
		
		
		model.addAttribute("magazine",magazine);
		model.addAttribute("sumlist",list);
		model.addAttribute("free",free);
		model.addAttribute("mvo",mvo);
		if(mvo.getListkey()==1) {
			return "client/magazine/Overseas/magazineDitail";
		}else {		
			return "client/magazine/bast/magazineDitail";
		}
	
		
	}

	
}
