package com.site.admin.chart.adChart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.site.admin.chart.adChart.service.AdChartService;
import com.site.admin.chart.adChart.vo.ColumnChartVO;
import com.site.admin.chart.adChart.vo.OdSellRCChartVO;
import com.site.admin.cost.adCost.service.AdCostService;
import com.site.admin.cost.adCost.vo.AdCostVO;
import com.site.common.file.ExcelReadUtil;
import com.site.common.vo.CostExcelVO;

@Controller
@RequestMapping(value="/admin/adChart")
public class AdChartController {

	@Autowired
	private AdChartService adChartService;
	@Autowired
	private AdCostService adCostService;
	
	@RequestMapping(value="/adChart.do")
	public String getChartMain() {
		return "admin/adChart/adChart";
	}
	
	@ResponseBody
	@RequestMapping(value="/odSellRC.do")
	public String getOdSellRCChart(ObjectMapper mapper) {
		List<OdSellRCChartVO> osrcList = adChartService.getOdSellRCChart();
		
		String chartData ="";
		try {
			chartData = mapper.writeValueAsString(osrcList);
		}catch(JsonProcessingException e){
			e.printStackTrace();
		}
		
		return chartData;
	}
	
	//원자재 부자재
	@ResponseBody
	@RequestMapping(value="/rowAndacc.do")
	public String getRowandAccChart(@ModelAttribute ColumnChartVO ccvo,HttpServletRequest request, ObjectMapper mapper) {
		int selectmonth =7;
		//service
		List<ColumnChartVO> columnData = adChartService.getRowandAccChart(selectmonth);
		List<String> excelList = adCostService.selectExcelList(selectmonth);
		
		//엑셀 에서 지출 읽어오기
		ExcelReadUtil eru = new ExcelReadUtil();
		//읽어온 엑셀 데이터 담기
		List<CostExcelVO> dataExcelList = new ArrayList<>();
		int sum =0;
		try {
			for(int i=0; i<excelList.size();i++) {
				dataExcelList = eru.readExcel(excelList.get(i), request);
			
				for(int j=0; j<dataExcelList.size(); j++) {
					if(dataExcelList.get(j).getMemo().equals("부자재비")) {
						sum += (Integer.parseInt(dataExcelList.get(j).getCost()))/1000;
					}		
				}
				columnData.get(i).setAccm(String.valueOf(sum));
				sum=0;
				
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String chartData = "";
		try {
			chartData = mapper.writeValueAsString(columnData);
			
		}catch(JsonProcessingException e) {
			   e.printStackTrace();
		   }
		return chartData;
	}
}
