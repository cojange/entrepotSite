package com.site.admin.chart.adChart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.chart.adChart.dao.AdChartDao;
import com.site.admin.chart.adChart.vo.ColumnChartVO;

@Service
public class AdChartServiceImpl implements AdChartService {

	@Autowired
	private AdChartDao adChartDao;

	@Override
	public List<ColumnChartVO> getRowandAccChart(int selectmonth) {
		List<ColumnChartVO> columnData  =  adChartDao.getRowandAccChart(selectmonth);
		return columnData;
	}
}
