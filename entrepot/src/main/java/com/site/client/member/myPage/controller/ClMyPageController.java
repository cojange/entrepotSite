package com.site.client.member.myPage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.site.client.member.login.controller.ClLoginController;
import com.site.client.member.login.vo.LoginVO;
import com.site.client.member.myPage.service.ClMyPageService;
import com.site.client.member.myPage.vo.ClMyPageVO;
import com.site.client.member.myPage.vo.ClOrderListVO;


@Controller
@RequestMapping(value="/client")
public class ClMyPageController {
	
	private Logger logger = Logger.getLogger(ClLoginController.class);
	@Autowired
	private ClMyPageService clMyPageService;
	
	/**************************************************************
	* 
	**************************************************************/
	@RequestMapping(value="/member/myPage{m_idx}.do",method = RequestMethod.GET)
	public ModelAndView myPage(@PathVariable String m_idx,ModelAndView mav,ClMyPageVO myPageVo,ClOrderListVO orderVo,HttpSession session){
		logger.info("myPage 메서드 호출 성공");
		
		
		LoginVO login = (LoginVO)session.getAttribute("login");
        
		
			 
			switch(m_idx) {
			   case "Whish": 
				   logger.info("찜리스트  호출 성공");
				   myPageVo.setRecord_num(login.getWhish());
				   List<ClMyPageVO> whishlist = clMyPageService.whishList(myPageVo);
				   mav.addObject("whishList",whishlist);
				   break;
			   case "Cart":
				   logger.info("장바구니  호출 성공");
				   myPageVo.setRecord_num(login.getCart());
				   List<ClMyPageVO> cartlist = clMyPageService.cartList(myPageVo);
				   mav.addObject("cartList",cartlist); 
				   break;
			   case "OrderList":
				   logger.info("주문내역  호출 성공");
				   orderVo.setM_num(login.getM_num());
				   List<ClOrderListVO> orderlist = clMyPageService.orderList(orderVo);
				   mav.addObject("orderList",orderlist);
				   break;
			   }	
		mav.setViewName("client/member/myPage/body/myPage");
		return mav;
	}
	
}
