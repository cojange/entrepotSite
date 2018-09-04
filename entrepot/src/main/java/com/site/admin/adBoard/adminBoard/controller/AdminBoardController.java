package com.site.admin.adBoard.adminBoard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.admin.adBoard.adminBoard.Service.AdminBoardService;
import com.site.admin.adBoard.adminBoard.vo.AdminBoardVO;
import com.site.admin.adBoard.adminBoard.vo.CouponVO;
import com.site.common.file.FileUploadUtil;

@Controller
@RequestMapping(value="/admin/adBoard/adminBoard")
public class AdminBoardController {
	Logger logger = Logger.getLogger(AdminBoardController.class);
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	/**
	 * 공지사항&이벤트 게시판 리스트 구현하기
	 * **/	
	@RequestMapping(value="/adminBoardList.do", method=RequestMethod.GET)
	public String adminBoardList(AdminBoardVO advo, CouponVO cvo, Model model) {
		logger.info("adminBoardList 호출 성공");
		
		List<AdminBoardVO> adminBoardList = adminBoardService.adminBoardList(advo);
		model.addAttribute("adminBoardList", adminBoardList);
		List<CouponVO>  couponList = adminBoardService.couponList(cvo);
		model.addAttribute("couponList", couponList);
		
		return "admin/adBoard/adminBoard/adminBoardList";
	}
	
	/**
	 * 쿠폰 등록 구현
	 * **/
	@RequestMapping(value="/couponInsert.do")
	public ResponseEntity<String> couponInsert(@RequestBody CouponVO cvo){
		logger.info("couponInsert 호출 성공");
		ResponseEntity<String> entity = null;
		int result;
		try {
			result = adminBoardService.couponInsert(cvo);
			if(result == 1) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			}
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	/**
	 * 쿠폰 수정 구현
	 * **/
	@ResponseBody
	@RequestMapping(value = "/{coupon_no}.do", method = RequestMethod.PUT)
	public String couponUpdate(@PathVariable("coupon_no") String coupon_no, @RequestBody CouponVO cvo){
		logger.info("couponUpdate 호출 성공");
		cvo.setCoupon_no(coupon_no);
		logger.info("값확인 controller :" + cvo.getCoupon_no() +"/"+ cvo.getCoupon_discount()+"/"+cvo.getCoupon_memo()+"/"+cvo.getCoupon_use());

		int reasult = adminBoardService.couponUpdate(cvo);
		if (reasult==1) {
			return "SUCCESS";
		}else {
			return "FALSE";
		}
	}
	
	/*****************************************************************
	 * 글쓰기 구현하기(첨부파일을 포함한 입력작업)
	 *****************************************************************/
	//첨부파일 받기위해 POST	
	@ResponseBody
	@RequestMapping(value="/adboardInsert.do", method=RequestMethod.POST)
	public String adboardInsert(AdminBoardVO advo, Model model, HttpServletRequest request) throws IllegalStateException, IOException {
		logger.info("adboardInsert 호출 성공");
		
		//확인 후 주석 처리
		/*logger.info("fileName : " + advo.getFile1().getOriginalFilename());
		logger.info("fileName : " + advo.getFile2().getOriginalFilename());*/
		
		int result = 0;
		String resultData = "";
		
		if(!advo.getFile1().isEmpty()) {  //비어있지 않으면
			String file_thumb = FileUploadUtil.fileUpload(advo.getFile1(), "adminBoardPopup", request,"abPop", "adminBoard");
			advo.setFile_thumb(file_thumb);
		}else {
			advo.setFile_thumb("");
		}
		if(!advo.getFile2().isEmpty()) {  //비어있지 않으면
			String ab_file = FileUploadUtil.fileUpload(advo.getFile2(), "adminBoardImg", request,"abImg", "adminBoard");
			advo.setAb_file(ab_file);
		}else {
			advo.setAb_file("");
		}
		
		result = adminBoardService.adboardInsert(advo);
		if(result == 1) {  //오류가 발생하지 않은 경우
			resultData = "SUCCESS";
		}else {  //오류가 발생한 경우
			resultData = "FALSE";
		}
		return resultData;
	}
}
