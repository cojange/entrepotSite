package com.site.client.board.useful.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.client.board.useful.service.UseFulService;
import com.site.client.board.useful.vo.UsefulVO;



@Controller
@RequestMapping(value="/client")
public class UseFulController {
	Logger logger = Logger.getLogger(UseFulController.class);
	
	@Autowired
	private UseFulService useFulService;
	
	@RequestMapping(value="/board/useful/usefulList.do",method=RequestMethod.GET)
	public String usefulList(@ModelAttribute("data")UsefulVO uvo, Model model) {
		logger.info("usefulList 호출 성공");
		logger.info("uvo:"+uvo.toString());
		List<UsefulVO> usefulList = useFulService.usefulList(uvo);
		
		logger.info("list:" + usefulList);
		model.addAttribute("usefulList", usefulList);
		
		return "client/board/useful/usefulList";
		
	}
	
	@RequestMapping(value="/board/useful/usefulDetail.do", method=RequestMethod.GET)
	public String usefulDetail(UsefulVO uvo, Model model) {
		logger.info("usefulDetail 호출 성공");
		logger.info("ub_no:"+uvo.getUb_no());
		
		UsefulVO detail = new UsefulVO();
		detail = useFulService.usefulDetail(uvo);
		if(detail!=null && (!detail.equals(""))) {
			detail.setUb_ans(detail.getUb_ans().toString().replaceAll("\n", "<br>"));
		}
		model.addAttribute("detail", detail);
		
		return "client/board/useful/usefulDetail";
	}
}
