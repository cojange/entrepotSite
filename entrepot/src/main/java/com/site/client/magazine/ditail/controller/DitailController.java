package com.site.client.magazine.ditail.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	/*@RequestMapping(value="/magazineDetail.do" ,method=RequestMethod.GET)
	public String magazineDetail(MagazineVO mvo,Model model) {
			
	}*/
	
}
