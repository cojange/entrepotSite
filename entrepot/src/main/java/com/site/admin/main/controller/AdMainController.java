package com.site.admin.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdMainController {
	
	@RequestMapping(value="/admin")
	public String main() {
		return "admin/template/adMainLayout";
	}
	

}
