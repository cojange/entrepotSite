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

import com.site.client.magazine.plus.service.PlusService;
import com.site.client.member.individual.service.ClGmService;
import com.site.client.member.individual.service.ClMService;
import com.site.client.member.individual.vo.ClGmVO;
import com.site.client.member.individual.vo.ClMVO;
import com.site.client.member.login.vo.LoginVO;
import com.site.client.member.myPage.service.ClMyPageService;
import com.site.client.member.myPage.vo.ClMyPageVO;
import com.site.client.member.myPage.vo.ClOrderListVO;
import com.site.client.member.sell.service.ClSellService;
import com.site.client.member.sell.vo.ClMultiOrderListVO;
import com.site.client.member.sell.vo.ClSellVO;

@Controller
@RequestMapping(value="/client")
public class ClSellController {
	
	Logger logger = Logger.getLogger(ClSellController.class);
	
	@Autowired
	private ClSellService clSellService;
	@Autowired
	private ClMyPageService clMyPageService;
	@Autowired
	private ClMService clMService;
	@Autowired
	private ClGmService clGmService;
/*	@Autowired
	private PlusService PlusService;*/
	
	/***********************************************
	 * 결제페이지
	 * ********************************************/
	@RequestMapping(value="/member/sell{m_idx}.do",method = RequestMethod.GET)
	public ModelAndView sellList(@PathVariable String m_idx,ModelAndView mav,ClMyPageVO myPageVo,ClMVO cvo,ClGmVO cgvo,HttpSession session){
		logger.info("sell.do get 방식에 의한 메서드 호출 성공");
		
		LoginVO login = (LoginVO)session.getAttribute("login");
		String mt = login.getMt().trim();
			if(mt.equals("개인")) {
				cvo.setM_num(login.getM_num());
				ClMVO member = clMService.memberSellSelect(cvo.getM_num());
				mav.addObject("member", member);
			}else if(mt.equals("단체")) {
				cgvo.setM_num(login.getM_num());
				ClGmVO gMember = clGmService.groupMemberSellSelect(cgvo.getM_num());
				mav.addObject("gmember", gMember);
			}
		
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
	
	/***********************************************
	 * 결제 정보입력후
	 * ********************************************/
	@RequestMapping(value="/member/payment.do",method = RequestMethod.POST)
	public ModelAndView paymentInsert(ClMultiOrderListVO cmovo,ModelAndView mav) {
		logger.info("payment.do post 방식에 의한 메서드 호출 성공");
		
		clSellService.paymentInsert(cmovo);
		
		mav.setViewName("client/member/member/paymentSuccess");
		
		return mav;
	}
}
