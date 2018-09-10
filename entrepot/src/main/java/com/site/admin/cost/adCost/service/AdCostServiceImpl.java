package com.site.admin.cost.adCost.service;

import java.io.File;
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

	//cost DB 입력
	@Override
	public int excelInsert(AdCostVO acvo, HttpServletRequest request)  throws IllegalStateException, IOException{
		
		GetDateUtil currentMonth = GetDateUtil.getInstance();
		String cost_file;
		int result = 0;
		if(!acvo.getFile().isEmpty()) {
			
			File parentsFile = new File(request.getSession().getServletContext().getRealPath("/uploadStorage/cost/cost"+currentMonth.getYear()));
			File[] files = parentsFile.listFiles();
			String indexName="";
			
			//파일 업로드
			cost_file = FileUploadUtil.fileUpload(acvo.getFile(),"cost", request, "cost"+currentMonth.getYear(),"cost");
			
			//중복 월수 파일 삭제 같은 날 올린 건 덮어쓰기
			int idx=0;
			idx = cost_file.lastIndexOf("_")+1;
			for(int i=0;i<files.length;i++) {
				if(files[i].isFile()) {
					indexName = files[i].getName();
					
					//업로드 파일과 기존 파일 이름이 같지 않다면 기존 파일 삭제
					if(!indexName.equals(cost_file)) {
						
						if(indexName.substring(idx, idx+3).
								equals(cost_file.substring(idx,idx+3))) {
							FileUploadUtil.fileDelete(indexName,"cost","cost", request);
							acvo.setLastFile(indexName);
						}
					}
				}
			}
				
			acvo.setCost_file(cost_file);
			//db에 존재하면 insert 생략
			if(adCostDao.excelSelect(cost_file.substring(idx,idx+3))!=null) {
				result=adCostDao.excelUpdate(acvo);
				return result;
			}else {
				result = adCostDao.excelInsert(acvo);
				
				return result;
			}
		}else {
			return 0;
		}
	}

	//card에 쓸 파일 등록
	@Override
	public List<AdCostVO> selectCard(String month) {
		
		List<AdCostVO> acList = new ArrayList<>();
		
		int mon = Integer.parseInt(month);
		String keyword;
		
		AdCostVO acvo;
		//월수 대로 반복
		for(int i=0; i<mon; i++) {
			try {
			
			keyword = i<9?("0"+i+"월"):i+"월";
			System.out.println("keyword : "+ keyword);
			//db에서 꺼내오기
			acvo = adCostDao.selectCard(keyword);
			
			//card에 쓸 이름
			if(acvo != null) {
				acvo.setCardName(keyword+" 지출내역");
				acList.add(acvo);
			}
			
			}catch(NullPointerException e) {
				System.out.println("selectCard Service null" + i+"월");
				continue;
			}
		}
	
		return acList;
	}

	//통계에서 쓸 엑셀 리스트
	@Override
	public List<String> selectExcelList(int selectmonth) {
		
		return adCostDao.selectExcelList(selectmonth);
	} 

}
