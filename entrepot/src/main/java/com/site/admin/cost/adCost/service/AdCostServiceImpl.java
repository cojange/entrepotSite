package com.site.admin.cost.adCost.service;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.cost.adCost.dao.AdCostDao;
import com.site.admin.cost.adCost.vo.AdCostVO;
import com.site.common.file.FileUploadUtil;
import com.site.common.util.GetDateUtil;



@Service
public class AdCostServiceImpl implements AdCostService{
	
	@Autowired
	private AdCostDao adCostDao;

	@Override
	public int excelInsert(AdCostVO acvo, HttpServletRequest request)  throws IllegalStateException, IOException{
		
		GetDateUtil currentMonth = GetDateUtil.getInstance();
		
		
		if(!acvo.getFile().isEmpty()) {
			String cost_file = FileUploadUtil.fileUpload(acvo.getFile(), request, "cost"+currentMonth.getYear());
			acvo.setCost_file(cost_file);
		}else {
			acvo.setCost_file("");
		}
		
		int result = adCostDao.excelInsert(acvo);
		
		return result;
	}

}
