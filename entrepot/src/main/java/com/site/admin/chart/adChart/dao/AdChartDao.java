package com.site.admin.chart.adChart.dao;

import java.util.List;

import com.site.admin.chart.adChart.vo.ColumnChartVO;

public interface AdChartDao {

	public List<ColumnChartVO> getRowandAccChart(int selectmonth);
}
