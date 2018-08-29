package com.site.admin.adBoard.regulations.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.site.admin.adBoard.regulations.service.RegulationsService;
import com.site.admin.adBoard.regulations.vo.RegAgreeVO;
import com.site.admin.adBoard.regulations.vo.RegulationsVO;
import com.site.admin.ctrl.adPartner.controller.AdPartnerController;
import com.site.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="/admin/adBoard/regulations")
public class RegulationsController {
	Logger logger = Logger.getLogger(AdPartnerController.class);
	
	@Autowired
	private RegulationsService regulationsService;
	
	/** 
	 * 약관동의리스트 및 약관리스트 구현하기
	 * **/ 
	@RequestMapping(value="/regulationsList.do", method=RequestMethod.GET)
	public ModelAndView regulationsList(RegulationsVO rvo, RegAgreeVO ravo, ModelAndView mav) {
		logger.info("regulations 호출 성공");
			
		List<RegulationsVO> regList = regulationsService.regList(rvo);
		mav.addObject("regList", regList);
		List<RegAgreeVO> regAgreeList = regulationsService.regAgreeList(ravo);
		mav.addObject("regAgreeList", regAgreeList);
		mav.setViewName("admin/adBoard/regulations/regulationsList");
		
		return mav;		
	}
	
	/** 
	 * 약관 등록 구현하기
	 * **/
	@ResponseBody
	@RequestMapping(value="/addRegulations.do")
	public String addRegulations(RegulationsVO rvo, HttpServletRequest request) throws IllegalStateException, IOException{
		logger.info("addRegulations 호출 성공");
		logger.info(rvo.getReg_type());
		
		String entity = null;
		int result = 0;
		
		if(rvo.getFile()!=null) {
			String fileName = FileUploadUtil.fileUpload(rvo.getFile(), "regText", request, "regulations", "reg");
			rvo.setReg_file(fileName);
			
		}else {
			rvo.setReg_file("");
		}
		
		try {
			result = regulationsService.addRegulations(rvo);
			if(result==1) {
				entity = "SUCCESS";
			}
		}catch(Exception e) {
			e.printStackTrace();
			entity = "FALSE";
		}
		return entity;		
	}
}
