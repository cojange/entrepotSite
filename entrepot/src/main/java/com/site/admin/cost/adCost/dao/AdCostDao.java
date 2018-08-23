package com.site.admin.cost.adCost.dao;



import com.site.admin.cost.adCost.vo.AdCostVO;

public interface AdCostDao {
	
	public int excelInsert(AdCostVO acvo);
	public AdCostVO selectCard(String keyword);
	
	public AdCostVO excelSelect(String cost_file);

}
