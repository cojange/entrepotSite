package com.site.admin.chart.adChart.service;

import java.util.List;

import com.site.admin.chart.adChart.vo.ColumnChartVO;
import com.site.admin.chart.adChart.vo.OdSellRCChartVO;

public interface AdChartService {
	
	public List<ColumnChartVO> getRowandAccChart(int selectmonth);
	public List<OdSellRCChartVO> getOdSellRCChart();
}
