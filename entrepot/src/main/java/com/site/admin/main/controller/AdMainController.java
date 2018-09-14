package com.site.admin.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.admin.order.orderList.service.AdOrderListService;
import com.site.admin.order.orderList.vo.AdSellListVO;
import com.site.common.util.GetDateUtil;
import com.site.common.util.WebCrawler;

@Controller
public class AdMainController {
	
	@Autowired
	private AdOrderListService adOrderListService;
	
	@RequestMapping(value="/admin")
	public String main(Model mav) {
		//스크래퍼
		WebCrawler scraper = new WebCrawler();
		GetDateUtil gdu = GetDateUtil.getInstance();
		
		//비용테이블
		List<AdSellListVO> sellData =  adOrderListService.getSellList();
		//구독중인 잡지 발주
	
		
		
		//데이터 테이블
		mav.addAttribute("booklist",scraper.getBook());
		mav.addAttribute("bookimg",scraper.getImg());
		mav.addAttribute("update" , gdu.getDate());
		mav.addAttribute("sellDt",sellData);
		return "admin/adHome";
	}
	
	/*@RequestMapping(value="/admin/kakaopayImpl")
	public String payment() {
		return "admin/kakaopay/kakaopayImpl";
	}
	@RequestMapping(value="/admin/kakaoexample")
	public String kakaoexample() {
		return "admin/kakaopay/kakaoexample";
	}*/
	
	

}
