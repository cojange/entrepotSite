package com.site.client.member.individual.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.individual.dao.ClGmDao;

@Service
public class ClGmServiceImpl implements ClGmService {

	Logger logger = Logger.getLogger(ClMServiceImpl.class);
	
	@Autowired
	private ClGmDao clGmDao;
}
