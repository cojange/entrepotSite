package com.site.admin.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.common.util.GetDateUtil;
import com.site.common.util.WebCrawler;

@Controller
public class AdMainController {
	
	@RequestMapping(value="/admin")
	public String main(Model mav) {
		
		WebCrawler scraper = new WebCrawler();
		GetDateUtil gdu = GetDateUtil.getInstance();
		
		mav.addAttribute("booklist",scraper.getBook());
		mav.addAttribute("bookimg",scraper.getImg());
		mav.addAttribute("update" , gdu.getDate());
		return "admin/adHome";
	}
	

}
