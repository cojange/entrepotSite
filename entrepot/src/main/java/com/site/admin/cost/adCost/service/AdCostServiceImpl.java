package com.site.admin.cost.adCost.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
		String cost_file;
		
		if(!acvo.getFile().isEmpty()) {
			cost_file = FileUploadUtil.fileUpload(acvo.getFile(), request, "cost"+currentMonth.getYear(),"cost");
			acvo.setCost_file(cost_file);
			//db에 존재하면 insert 생략
			if(adCostDao.excelSelect(cost_file)!=null) {
				return 1;
			}
		}else {
			cost_file ="";
			acvo.setCost_file(cost_file);
		}
		
		
		
		int result = adCostDao.excelInsert(acvo);
		
		return result;
	}

	@Override
	public List<AdCostVO> selectCard(String month) {
		
		List<AdCostVO> acList = new ArrayList<>();
		
		int mon = Integer.parseInt(month);
		String keyword;
		
		AdCostVO acvo;
		//월수 대로 반복
		for(int i=0; i<mon; i++) {
			try {
			keyword = (i+1)+"월";
			acvo = adCostDao.selectCard(keyword);
			acvo.setCardName(keyword+" 지출내역");
			acList.add(acvo);
			}catch(NullPointerException e) {
				System.out.println("selectCard Service null" + i+"월");
				continue;
			}
		}
	
		return acList;
	}

}
