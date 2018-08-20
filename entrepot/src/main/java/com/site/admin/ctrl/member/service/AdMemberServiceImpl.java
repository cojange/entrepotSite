package com.site.admin.ctrl.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.ctrl.member.dao.AdMemberDao;

@Service
public class AdMemberServiceImpl implements AdMemberService{
	
	@Autowired
	private AdMemberDao adMemberDao;
}
