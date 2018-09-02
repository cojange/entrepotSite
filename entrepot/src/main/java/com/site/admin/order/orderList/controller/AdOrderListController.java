package com.site.admin.order.orderList.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.site.admin.order.orderList.service.AdOrderListService;
import com.site.admin.order.orderList.vo.AdMonthKeyVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdOrderProductVO;
import com.site.admin.order.orderList.vo.AdSellListVO;

@Controller
@RequestMapping(value="/admin/order/orderList")
public class AdOrderListController {

	@Autowired
	private AdOrderListService adOrderListService;
	
	//주문 페이지열기 && sellList 가져오기
	@RequestMapping(value="/getSell.do")
	public String getSellList(Model model) {
		List<AdSellListVO> sellList = adOrderListService.getSellList();
		List<AdOrderProductVO> orderPList = adOrderListService.getOrderProduct();
		
		model.addAttribute("orderProduct",orderPList);
		model.addAttribute("sellList",sellList);
		return "admin/order/adOrderList/sellList";
	}
	
	//날짜 기반 sellList 가져오기
	@ResponseBody
	@RequestMapping(value="/searchDate.do", method=RequestMethod.POST)
	public String getSell(ObjectMapper mapper,AdMonthKeyVO mkvo) {
		
		if( mkvo.getsDate()!=null) {
			mkvo.setMonthkey(0);
		};
		
		List<AdSellListVO> sellDList = adOrderListService.getSearchDate(mkvo);
		
		String sellListData="";
		
		try {
			sellListData = mapper.writeValueAsString(sellDList);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return sellListData;
	}
	
	@ResponseBody
	@RequestMapping(value="/getOrder.do")
	public String getOrder(@ModelAttribute AdSellListVO slvo, ObjectMapper mapper) {
		
		List<AdOrderListVO> orderList = adOrderListService.getOrderList(slvo);
		String orderListData="";
		
		try {
			orderListData = mapper.writeValueAsString(orderList);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return orderListData;
		
	}
	
	
}
