package com.site.client.board.adminboard.controller;


import java.util.List;




import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.client.board.adminboard.service.ClAdminBoardService;
import com.site.client.board.adminboard.vo.ClAdminBoardVO;



@Controller
@RequestMapping(value="/client")
public class ClAdminBoardController {
	Logger logger = Logger.getLogger(ClAdminBoardController.class);
			
	@Autowired
	private ClAdminBoardService clAdminBoardService;
	
	//공지게시판
	@RequestMapping(value="/board/adminboard/adminboardList.do",method=RequestMethod.GET)
	public String adminboardList(@ModelAttribute("data")ClAdminBoardVO cavo, Model model) {
		logger.info("adminboardList 호출 성공");
		logger.info("cavo:"+cavo.toString());
		List<ClAdminBoardVO> adminboardList = clAdminBoardService.adminboardList(cavo);
		
		logger.info("list:" + adminboardList);
		model.addAttribute("adminboardList", adminboardList);
		
		return "client/board/adminboard/adminboardList";
		
	}
	@RequestMapping(value="/board/adminboard/adminboardDetail.do",method=RequestMethod.GET)
	public String adminboardDetail(ClAdminBoardVO cavo,Model model) {
		logger.info("adminboardDetail 호출 성공");
		logger.info("ab_no="+cavo.getAb_no());
		
		ClAdminBoardVO detail = new ClAdminBoardVO();
		detail = clAdminBoardService.adminboardDetail(cavo);
		if(detail!=null && (!detail.equals(""))) {
			detail.setAb_content(detail.getAb_content().toString().replaceAll("\n", "<br>"));
		}
		model.addAttribute("detail", detail);
		
		return "client/board/adminboard/adminboardDetail"; //jsp 이동 리턴값
	}
	
}
