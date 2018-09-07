package com.site.admin.magazine.adMagazine.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.site.admin.magazine.adMagazine.service.AdMagazineService;
import com.site.admin.magazine.adMagazine.vo.MagazineSearchVO;
import com.site.client.magazine.ditail.vo.MagazineVO;

@Controller
@RequestMapping(value="admin/magazine/adMagazine")
public class AdMagazineController {
	Logger logger = Logger.getLogger(AdMagazineController.class);
	
	@Autowired
	private AdMagazineService adMagazineService;
	
	/**
	 * 상품 리스트 구현하기
	 * **/	
	@RequestMapping(value="adMagazineList.do", method=RequestMethod.GET)
	public String adMagazineList(MagazineSearchVO msvo, Model model) {
		logger.info("adMagazineList 호출 성공");		
		
		List<MagazineVO> adMagazineList = adMagazineService.adMagazineList(msvo);
		model.addAttribute("adMagazineList", adMagazineList);
		
		System.out.println(adMagazineList.toString());
		
		return "admin/magazine/adMagazine/adMagazineList";
	}
	
	/**
	 * 상품 입력페이지 가기
	 * **/
	@RequestMapping(value="/adMagazineInsertForm.do")
	public String adMagazineInsertForm(Model model) {
		logger.info("writeForm 호출 성공");
		
		List<MagazineSearchVO> keywordList = adMagazineService.callDtKeyword();
		
		
		
		Set<String> keyword = new HashSet<>();
		String key="";
		for (int i=0; i<keywordList.size(); i++) {
			key = keywordList.get(i).getDt_keyword();
			
			String [] index = key.split("/");
			
			for(int j=0; j<index.length; j++) {
				keyword.add(index[j]);
			}
			
		};
		
		Set<String> target = new HashSet<>();
		String tar="";
		for ( int i=0; i<keywordList.size(); i++){
			tar = keywordList.get(i).getDt_target();
			String [] index = tar.split("/");
			for(int j=0; j<index.length; j++) {
				target.add(index[j]);
			}
		};
		logger.info("keyword : " + keyword.toString());
		model.addAttribute("dt_keyword", keyword);
		model.addAttribute("dt_target",target);
		
		return "admin/magazine/adMagazine/adMagazineInsertForm";
	}
	
	//상세페이지 등록
	@RequestMapping(value="/adDetailInsert.do")
	public String adDetailInsert( MagazineSearchVO msvo, HttpServletRequest request, Model model) {	
		logger.info("detail 입력하기 ");
		logger.info("list all : " + msvo.toString());
		
		String contentResult = adMagazineService.adDetailInsert(msvo, request);
		
		model.addAttribute("detailInsertResult", contentResult);
		MagazineSearchVO nmsvo = new MagazineSearchVO();
		return adMagazineList(nmsvo, model);
	}
	
	
	/**
	 * 잡지 정보 가졍괴
	 */
	@ResponseBody
	@RequestMapping(value="/callMgPartner.do")
	public String callMgPartner(ObjectMapper mapper) {
		logger.info("callMgPartner 호출 성공");
		
		String mginfoData = "";
		List<String> mginfoList = adMagazineService.callMgPartner();
		
		try {
			mginfoData = mapper.writeValueAsString(mginfoList);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return mginfoData;
		
		
	}
	
	/**
	 * 잡지 코드 가졍괴
	 */
	@ResponseBody
	@RequestMapping(value="/callMgCode.do")
	public String callMgNum(ObjectMapper mapper, @RequestParam(value="com_name") String com_name) {
		logger.info("callMgNum 호출 성공");
		
		String mginfoData = "";
		List<String> mginfoList = adMagazineService.callMgNum(com_name);
		
		try {
			mginfoData = mapper.writeValueAsString(mginfoList);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return mginfoData;
		
		
	}
	//잡지등록
	@ResponseBody
	@RequestMapping(value="/insertMagazine.do")
	public String insertMagazine(MagazineSearchVO msvo) {
		logger.info("insertMagazine 호출 성공");
		String result = "";
		
		result = adMagazineService.insertMagazine(msvo);
		
		return result;

	}
	
/*	//상세등록
	@RequestMapping(value="/insertDetail.do")
	public String insertDetail(MagazineSearchVO msvo, Model model) {
		logger.info("insertDetail 호출 성공");
		
		System.out.println(msvo.toString());
		MagazineSearchVO newmvo = new MagazineSearchVO();
		
		return adMagazineList(newmvo,model);
	}*/	
}
