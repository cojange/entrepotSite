package com.site.admin.order.orderList.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.site.admin.order.orderList.service.AdOrderListService;
import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdSellListVO;

@Controller
@RequestMapping(value="/admin/order/orderList")
public class AdOrderListController {

	@Autowired
	private AdOrderListService adOrderListService;
	
	//전체 sellList 가져오기
	@RequestMapping(value="/getSellList.do")
	public String getSellList(Model model) {
		
		List<AdSellListVO> sellList = adOrderListService.getSellList();
		
		model.addAttribute("sellList",sellList);
		
		return "admin/order/adOrderList/sellList";
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
