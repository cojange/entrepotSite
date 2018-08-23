package com.site.client.member.myPage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.myPage.dao.ClMyPageDao;


@Service
public class ClMyPageServiceImpl implements ClMyPageService {
	
	@Autowired
	private ClMyPageDao clMyPageDao;

}
