package com.site.admin.adBoard.personalBoard.controller;

import java.util.List;

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
import com.site.admin.adBoard.personalBoard.service.PersonalBoardService;
import com.site.admin.adBoard.personalBoard.vo.PbReplyVO;
import com.site.admin.adBoard.personalBoard.vo.PersonalBoardVO;
import com.site.admin.order.orderList.vo.AdOrderListVO;

@Controller
@RequestMapping(value="/admin/adBoard/personalBoard")
public class PersonalBoardController {
	Logger logger = Logger.getLogger(PersonalBoardController.class);
	
	@Autowired
	private PersonalBoardService personalBoardService;
	
	/**
	 * 1:1 게시판 리스트 구현하기
	 * **/
	@RequestMapping(value="/personalBoardList.do", method=RequestMethod.GET)
	public String personalBoardList(PersonalBoardVO pbvo, Model model) {
		logger.info("personalBoardList 호출 성공");
		
		List<PersonalBoardVO> personalBoardList = personalBoardService.personalBoardList(pbvo);
		model.addAttribute("personalBoardList", personalBoardList);
		
		return "admin/adBoard/personalBoard/personalBoardList";
	}
	
	/**
	 * 댓글 가져오기
	 * **/
	@ResponseBody
	@RequestMapping(value="/pbReply.do")
	public String pbReplyList(PbReplyVO pbrvo, ObjectMapper mapper, @RequestParam(value="pb_no")int pb_no) {
		
		List<AdOrderListVO> pbReplyList = personalBoardService.pbReplyList(pbrvo);
		System.out.println(pbReplyList);
		System.out.println("컨트롤러 : "+pbrvo.getPb_no());
		String pbReplyListData="";
		
		try {
			pbReplyListData = mapper.writeValueAsString(pbReplyList);
		}catch(JsonProcessingException e) {
			e.printStackTrace();
		}
		return pbReplyListData;		
	}
	
	/*****************************************************************
	 * 댓글쓰기 
	 ******************************************************************/
	@RequestMapping(value="/pbReInsert.do", method=RequestMethod.POST)
	public String pbReInsert(PbReplyVO pbrvo, Model model) {
		logger.info("pbReInsert 호출 성공");
		
		//result == 0 을 제어하는 경우 사용
		int result = 0;
		String url="";
		
		result = personalBoardService.pbReInsert(pbrvo);
		
		if(result == 1) {  //오류가 발생하지 않은 경우
			url = "/admin/adBoard/personalBoard/personalBoardList.do";
		}else {  //오류가 발생한 경우
		    model.addAttribute("code", 1);  //오류 내용
			url = "/admin/adBoard/personalBoard/personalBoardList.do";
		}
		return "redirect:"+url;
	}
}