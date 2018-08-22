package com.site.admin.cost.adCost.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.site.admin.cost.adCost.service.AdCostService;
import com.site.admin.cost.adCost.vo.AdCostVO;


@Controller
@RequestMapping(value="/admin/adcost")
public class AdCostController {
	
	@Autowired
	private AdCostService adCostService;
	
	@RequestMapping(value="/adCostList.do")
	public ModelAndView adCostList(ModelAndView mav) {
		mav.setViewName("admin/adcost/adCostList");
		return mav;
	}
	
	@RequestMapping(value="/uploadExcel")
	public String uploadCostExcel(AdCostVO acvo, HttpServletRequest request){
		int result=0;
		String url="";
		
		
		
		try {
			result=adCostService.excelInsert(acvo, request);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		if(result == 1) {
			url="/admin/adcost/adCostList";
		}else {
			url="/admin";
		}
		
		return "redirect:"+url;
	}
	

}
