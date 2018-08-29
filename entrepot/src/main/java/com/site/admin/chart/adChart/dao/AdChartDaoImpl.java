package com.site.admin.chart.adChart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.chart.adChart.vo.ColumnChartVO;

@Repository
public class AdChartDaoImpl implements AdChartDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<ColumnChartVO> getRowandAccChart(int selectmonth) {
		return session.selectList("getRowandAccChart",selectmonth);
	}
}
