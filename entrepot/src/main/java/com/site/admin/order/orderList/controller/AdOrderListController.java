package com.site.admin.order.orderList.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.site.admin.order.orderList.service.AdOrderListService;
import com.site.admin.order.orderList.vo.AdChangeVO;
import com.site.admin.order.orderList.vo.AdMonthKeyVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;
import com.site.admin.order.orderList.vo.AdOrderProductVO;
import com.site.admin.order.orderList.vo.AdRefundVO;
import com.site.admin.order.orderList.vo.AdSellListVO;
import com.site.common.vo.CommonVO;

@Controller
@RequestMapping(value="/admin/order/orderList")
public class AdOrderListController {

	@Autowired
	private AdOrderListService adOrderListService;
	
	//주문 페이지열기 && sellList 가져오기
	@RequestMapping(value="/getSell.do")
	public String getSellList(Model model) {
		List<AdSellListVO> sellList = adOrderListService.getSellList();
		CommonVO cvo = new CommonVO();
		cvo.setKeyword("all");
		List<AdOrderProductVO> orderPList = adOrderListService.getOrderProduct(cvo);
		
		model.addAttribute("orderProduct",orderPList);
		model.addAttribute("sellList",sellList);
		return "admin/order/adOrderList/sellList";
	}
	
	//주문 판매 교환 환불 건수 확인
	@ResponseBody
	@RequestMapping(value="/getKindOrder.do", method=RequestMethod.POST)
	public String getKindOrder(ObjectMapper mapper,CommonVO cvo) {
		List<AdOrderProductVO> orderPList = adOrderListService.getOrderProduct(cvo);
		String orderList="";
		try {
			orderList = mapper.writeValueAsString(orderPList);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return orderList;
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
	
	//상세내역 가져오기
	@ResponseBody
	@RequestMapping(value="/getOrder.do")
	public String getOrder(AdSellListVO slvo, ObjectMapper mapper) {
		
		List<AdOrderListVO> orderList = adOrderListService.getOrderList(slvo);
		String orderListData="";
		
		try {
			orderListData = mapper.writeValueAsString(orderList);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return orderListData;
		
	}
	
	//환불 신청 내역
	@ResponseBody
	@RequestMapping(value="/getRefund.do")
	public String getRefund(CommonVO cvo, ObjectMapper mapper) {
		List<AdRefundVO> refundList = adOrderListService.getRefundList(cvo);
		String refundData ="";
		try {
			refundData = mapper.writeValueAsString(refundList);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return refundData;
	}
	
	//교환 신청내역
	@ResponseBody
	@RequestMapping(value="/getChange.do")
	public String getChange(CommonVO cvo, ObjectMapper mapper) {
		List<AdChangeVO> changeList = adOrderListService.getChangeList(cvo);
		String changeData ="";
		try {
			changeData = mapper.writeValueAsString(changeList);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return changeData;
	}
	
	//환불요청 승인 거절(ajax요청 배열로 받기)
	@ResponseBody
	@RequestMapping(value="/cancelRefund.do")
	public String cancelRefund(@RequestParam(value ="refundNum") List<String> refundNum) {

		
		String result= adOrderListService.cancelRefund(refundNum);
		
		return result;
	}
	//교환요청 승인 거절(ajax요청 배열로 받기)
		@ResponseBody
		@RequestMapping(value="/cancelChange.do")
		public String cancelChange(@RequestParam(value ="changeNum") List<String> changeNum) {

			
			String result= adOrderListService.cancelChange(changeNum);
			
			return result;
		}
		
		//환불 승인
		@ResponseBody
		@RequestMapping(value="/confirmRefund.do")
		public String confirmRefund(@RequestParam(value ="refundNum") List<String> refundNum) {

			
			String result= adOrderListService.confirmRefund(refundNum);
			
			return result;
		}
		//교환 요청 승인
		@ResponseBody
		@RequestMapping(value="/confirmChange.do")
		public String confirmChange(@RequestParam(value ="changeNum") List<String> changeNum) {

			
			String result= adOrderListService.confirmChange(changeNum);
			
			return result;
		}
		
		//발주 확인
		@RequestMapping(value="/confirmOrder.do")
		public String confirmOrder(CommonVO cvo, Model model) {
			
			adOrderListService.confirmOrder(cvo);
			
			return getSellList(model);
		}


}
