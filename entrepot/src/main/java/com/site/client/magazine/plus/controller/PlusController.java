package com.site.client.magazine.plus.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.client.magazine.plus.service.PlusService;

@Controller
@RequestMapping(value="/plus")
public class PlusController {
	Logger logger = Logger.getLogger(PlusController.class);
	
	@Autowired
	private PlusService plusService;
	
}
