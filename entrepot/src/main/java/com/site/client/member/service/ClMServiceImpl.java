package com.site.client.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.dao.ClMDao;

@Service
public class ClMServiceImpl implements ClMService {
		
	@Autowired
	private ClMDao clMDao;
}
