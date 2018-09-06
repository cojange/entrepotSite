package com.site.client;


import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.client.board.imgb.service.ClImgbService;
import com.site.client.board.imgb.vo.ClImgbVO;
import com.site.client.magazine.ditail.vo.MagazineVO;
import com.site.client.magazine.list.service.ListService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private ListService listservice;
	@Autowired
	private ClImgbService climgbservice;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale,MagazineVO mvo,ClImgbVO cvo, Model model) {
		logger.info("main호출성공");
		
		List<MagazineVO> alist = listservice.bastlist(mvo);
		List<ClImgbVO> fotolist= climgbservice.fotolist(cvo);
		List<MagazineVO> jlist = listservice.jlist(mvo);
		List<MagazineVO> elist = listservice.elist(mvo);
		List<MagazineVO> aplist= listservice.aplist(mvo);
		
		model.addAttribute("bastlist",alist);
		model.addAttribute("fotolist",fotolist);
		model.addAttribute("jlist", jlist);
		model.addAttribute("elist", elist);
		model.addAttribute("aplist", aplist);
		return "home";
	}
	
}
