package com.site.client.magazine.list.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.site.client.magazine.ditail.vo.MagazineVO;

import com.site.client.magazine.list.service.ListService;
import com.site.client.member.myPage.vo.ClMyPageVO;

@Controller
@RequestMapping(value="/client/list")
public class ListController {
	Logger logger = Logger.getLogger(ListController.class);
	@Autowired
	private ListService listService;
	
	@RequestMapping(value="/magazinelist.do",method = RequestMethod.GET)
	public String megazineList(@ModelAttribute("data") MagazineVO mvo,Model model){
		logger.info("magazinelist.do get 방식에 의한 메서드 호출 성공");
		
		int mylist = listService.listcount(mvo); //총 리스트 개수
		
		logger.info("listkey : "+mvo.getListkey());
		mvo.setCountList(4);
		mvo.setTotalpage(mylist/mvo.getCountList());
		
		if(mylist % mvo.getCountList()>0) {
			mvo.setTotalpage(mvo.getTotalpage()+1);
		}
		if(mvo.getTotalpage() < mvo.getPage()) {
			mvo.setPage(mvo.getTotalpage());
		}
		mvo.setStart((mvo.getPage()-1)*mvo.getCountList()+1);
		mvo.setEnd(mvo.getStart()+mvo.getCountList()-1);
		//전체 레코드 구현
		
		List<MagazineVO> magazineList = listService.magazineList(mvo); 
		
	

		model.addAttribute("magazienlist",magazineList);
		model.addAttribute("mvo",mvo);
		if(mvo.getListkey()==1) {
			return "client/magazine/Overseas/magazinelist";
		}else {		
			return "client/magazine/bast/magazinelist";
		}
	}
	
	@RequestMapping(value="/card.do")
	public ResponseEntity<String> card(@RequestBody ClMyPageVO pvo){
		logger.info("card 호출성공");
		logger.info("pvo:" +pvo.getRecord_num());
		logger.info("pvo:" +pvo.getMg_num());
		logger.info("pvo:" +pvo.getEa());
		ResponseEntity<String> entity = null;
		int result;
		try {
			result =listService.card(pvo);
			if(result ==1) {
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
/*	@RequestMapping(value="/jlist.do",method=RequestMethod.GET)
	public ResponseEntity<List<MagazineVO>> jlist(MagazineVO mvo){
		ResponseEntity<List<MagazineVO>> entity =null;
		try {
			entity = new ResponseEntity<>(listService.jlist(mvo),HttpStatus.OK);
			
				
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}*/
	
	
}
