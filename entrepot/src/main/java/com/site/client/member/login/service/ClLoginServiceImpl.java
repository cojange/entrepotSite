package com.site.client.member.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.individual.dao.ClMDao;

@Service
public class ClLoginServiceImpl implements ClLoginService {
		
	@Autowired
	private ClMDao clMDao;


}
