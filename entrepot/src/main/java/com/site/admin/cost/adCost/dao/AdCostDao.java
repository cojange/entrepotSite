package com.site.admin.cost.adCost.dao;



import java.util.List;

import com.site.admin.cost.adCost.vo.AdCostVO;

public interface AdCostDao {
	
	public int excelInsert(AdCostVO acvo);
	public AdCostVO selectCard(String keyword);
	public AdCostVO excelSelect(String month);
	public int excelUpdate(AdCostVO acvo);
	public List<String> selectExcelList(int selectmonth);

}
