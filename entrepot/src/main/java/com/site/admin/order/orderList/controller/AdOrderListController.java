package com.site.admin.order.orderList.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.admin.order.orderList.service.AdOrderListService;
import com.site.admin.order.orderList.vo.AdSellListVO;

@Controller
@RequestMapping(value="/admin/order/orderList")
public class AdOrderListController {

	@Autowired
	private AdOrderListService adOrderListService;
	
	@RequestMapping(value="/getSellList.do")
	public String getSellList(Model model) {
		
		List<AdSellListVO> sellList = adOrderListService.getSellList();
		
		model.addAttribute("sellList",sellList);
		
		return "admin/order/adOrderList/sellList";
	}
}
