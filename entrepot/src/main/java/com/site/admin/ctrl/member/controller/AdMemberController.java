package com.site.admin.ctrl.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.site.admin.ctrl.member.service.AdMemberService;

@Controller
@RequestMapping(value="/ctrl/member")
public class AdMemberController {
	
	@Autowired
	private AdMemberService adMemberService;
}
