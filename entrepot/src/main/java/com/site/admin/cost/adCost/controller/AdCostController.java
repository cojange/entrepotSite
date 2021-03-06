package com.site.admin.cost.adCost.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.site.admin.cost.adCost.service.AdCostService;
import com.site.admin.cost.adCost.vo.AdCostVO;
import com.site.common.excel.ListExcelView;
import com.site.common.file.ExcelReadUtil;
import com.site.common.util.GetDateUtil;
import com.site.common.vo.CostExcelVO;


@Controller
@RequestMapping(value="/admin/adcost")
public class AdCostController {
	
	@Autowired
	private AdCostService adCostService;
	
	//cost탭 페이지
	@RequestMapping(value="/adCostList.do")
	public ModelAndView adCostList(ModelAndView mav) {
		
		GetDateUtil gdu = GetDateUtil.getInstance();
		
		List<AdCostVO> acList = adCostService.selectCard(gdu.getMonth());
		
		mav.addObject("cardList",acList);
		
		mav.setViewName("admin/adcost/adCostList");
		return mav;
	}
	
	//엑셀 파일 업로드
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
			url="/admin/adcost/adCostList.do";
		}else {
			url="/admin";
		}
		
		return "redirect:"+url;
	}
	
	//template 다운로드
	@RequestMapping(value="/downloadTemplate.do", method=RequestMethod.GET)
	public ModelAndView costExcel() {
		
		GetDateUtil gdu = GetDateUtil.getInstance();
		//추후 한글 인코딩 후 등록
		String month = gdu.getMonth() +"월 지출 리스트";
		
		ModelAndView mav = new ModelAndView(new ListExcelView());
		mav.addObject("month", month);
		mav.addObject("template","cost_template.xlsx");
		mav.addObject("file_name","cost_template");
		
		return mav;
	}
	
	//엑셀 파일 읽어오기
	@RequestMapping(value="/readExcel.do")
	public ModelAndView readExcel(@ModelAttribute("acvo") AdCostVO acvo, ModelAndView mav, HttpServletRequest request) {
		
		ExcelReadUtil eru = new ExcelReadUtil();
		
		List<CostExcelVO> ceList = new ArrayList<>();
		try {
			ceList = eru.readExcel(acvo.getCost_file(), request);
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("status","fail");
		}
		
//		System.out.println(ceList.toString());
		
		mav.addObject("costTable",ceList);
		return adCostList(mav);
	}
	
}
