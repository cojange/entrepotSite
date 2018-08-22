package com.site.admin.cost.adCost.service;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.site.admin.cost.adCost.vo.AdCostVO;

public interface AdCostService {
	public int excelInsert(AdCostVO acvo, HttpServletRequest request) throws IllegalStateException, IOException;
}
