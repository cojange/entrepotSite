package com.site.client.magazine.list.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.client.magazine.list.service.ListService;

@Controller
@RequestMapping(value="/list")
public class ListController {
	Logger logger = Logger.getLogger(ListController.class);
	@Autowired
	private ListService listService;
	
}
