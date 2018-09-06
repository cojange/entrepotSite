package com.site.client.member.sell.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.site.client.member.login.vo.LoginVO;
import com.site.client.member.myPage.service.ClMyPageService;
import com.site.client.member.myPage.vo.ClMyPageVO;
import com.site.client.member.sell.service.ClSellService;

@Controller
@RequestMapping(value="/client")
public class ClSellController {
	
	Logger logger = Logger.getLogger(ClSellController.class);
	
	@Autowired
	private ClSellService clSellService;
	@Autowired
	private ClMyPageService clMyPageService;
	
	/***********************************************
	 * 결제페이지
	 * ********************************************/
	@RequestMapping(value="/member/sell{m_idx}.do",method = RequestMethod.GET)
	public ModelAndView sellList(@PathVariable String m_idx,ModelAndView mav,ClMyPageVO myPageVo,HttpSession session){
		logger.info("sell.do get 방식에 의한 메서드 호출 성공");
		
		LoginVO login = (LoginVO)session.getAttribute("login");
		
		switch(m_idx) {
		   case "Whish": 
			   logger.info("찜리스트 구매정보  호출 성공");
			   myPageVo.setRecord_num(login.getWhish());
			   List<ClMyPageVO> whishlist = clMyPageService.whishList(myPageVo);
			   mav.addObject("whishList",whishlist);
			   break;
		   case "Cart":
			   logger.info("장바구니  구매정보 호출 성공");
			   myPageVo.setRecord_num(login.getCart());
			   List<ClMyPageVO> cartlist = clMyPageService.cartList(myPageVo);
			   mav.addObject("cartList",cartlist);
			   break;
		}
		mav.setViewName("client/member/sell/sell"); 
		return mav;
	}
}
