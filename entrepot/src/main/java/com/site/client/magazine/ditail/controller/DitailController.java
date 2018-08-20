package com.site.client.magazine.ditail.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.client.magazine.ditail.service.DitailService;

@Controller
@RequestMapping(value="/ditail")
public class DitailController {
	Logger logger = Logger.getLogger(DitailController.class);
	@Autowired
	private DitailService ditailService;
	
	
}
