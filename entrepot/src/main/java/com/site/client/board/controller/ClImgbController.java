package com.site.client.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.client.board.service.ClImgbService;

@Controller
@RequestMapping(value="/client")
public class ClImgbController {
	
	@Autowired
	private ClImgbService clImgbService;
	
	
	@RequestMapping(value="/imgbList.do")
	public String ClImgbList() {
		
		return "client/clImgbList";
	}

}
