package com.site.client.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/client")
public class ClMController{
	
	@Autowired

	
	@RequestMapping(value="/mForm.do")
	public String memberForm(){
		
		return "client/clMForm";
	}

}
