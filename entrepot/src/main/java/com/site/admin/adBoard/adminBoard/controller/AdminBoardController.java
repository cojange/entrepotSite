package com.site.admin.adBoard.adminBoard.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.admin.adBoard.adminBoard.Service.AdminBoardService;
import com.site.admin.adBoard.adminBoard.vo.AdminBoardVO;
import com.site.admin.adBoard.adminBoard.vo.CouponVO;

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
	
	
}
