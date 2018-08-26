package com.site.admin.adBoard.regulations.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.site.admin.adBoard.regulations.service.RegulationsService;
import com.site.admin.adBoard.regulations.vo.RegAgreeVO;
import com.site.admin.adBoard.regulations.vo.RegulationsVO;
import com.site.admin.ctrl.adPartner.controller.AdPartnerController;

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
	/*@ResponseBody
	@RequestMapping(value="/regulationsInsert.do", method=RequestMethod.POST, produces="text/plain; charset=UTF-8")
	public String regulationsInsert(RegulationsVO rvo, HttpServletRequest request) throws Exception{
		logger.info("regulationsInsert 호출 성공");
		
		logger.info("file name : "+rvo.getReg_file().getOriginalFilename());
		String value = "";
		int result = 0;
		
		if(rvo.getFile()!=null) {
			String fileName = FileUploadUtil.fileUpload(rvo.getFile(), request, "gallery");
			rvo.getReg_file(fileName);
			
			String thumbName = FileUploadUtil.makeThumbnail(fileName, request);
			rvo.setG_thumb(thumbName);
		}
		result = galleryService.galleryInsert(gvo);
		if(result==1) {
			value = "성공";
		}else {
			value = "실패";
		}
		//return result+"";  //문자형태로 만들어 리턴한다(0,1로 리턴할 경우)
		return value;
	}*/
}
