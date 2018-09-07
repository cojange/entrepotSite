package com.site.client.member.sell.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.site.client.member.individual.service.ClGmService;
import com.site.client.member.individual.service.ClMService;
import com.site.client.member.individual.vo.ClGmVO;
import com.site.client.member.individual.vo.ClMVO;
import com.site.client.member.login.vo.LoginVO;
import com.site.client.member.myPage.service.ClMyPageService;
import com.site.client.member.myPage.vo.ClMyPageVO;
import com.site.client.member.sell.service.ClSellService;
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
	
	/***********************************************
	 * 결제페이지
	 * ********************************************/
	@RequestMapping(value="/member/sell{m_idx}.do",method = RequestMethod.GET)
	public ModelAndView sellList(@PathVariable String m_idx,ModelAndView mav,ClMyPageVO myPageVo,ClMVO cvo,ClGmVO cgvo,HttpSession session){
		logger.info("sell.do get 방식에 의한 메서드 호출 성공");
		
		LoginVO login = (LoginVO)session.getAttribute("login");
		logger.info("로그인 타입 : "+login.getMt());
		String mt = login.getMt().trim();
		logger.info("trim result : " + mt);
			if(mt.equals("개인")) {
				logger.info("개인실행 : "+login.getMt());
				cvo.setM_num(login.getM_num());
				ClMVO member = clMService.memberSellSelect(cvo.getM_num());
				logger.info("개인정보리턴 : "+member);
				mav.addObject("member", member);
			}else if(mt.equals("단체")) {
				logger.info("단체실행 : "+login.getMt());
				cgvo.setM_num(login.getM_num());
				ClGmVO gMember = clGmService.groupMemberSellSelect(cgvo.getM_num());
				logger.info("단체정보리턴 : "+gMember);
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
	public ModelAndView paymentInsert(ClSellVO csvo,ModelAndView mav) {
		logger.info("payment.do post 방식에 의한 메서드 호출 성공");
		int result;
		result = clSellService.paymentInsert(csvo);
		if(result==1) {
			
			mav.setViewName("client/member/member/paymentSuccess");
		}	
		return mav;
	}
}
