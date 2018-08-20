package com.site.client.magazine.plus.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.magazine.plus.dao.PlusDao;

@Service
public class PlusServiceImpl implements PlusService {
	Logger logger = Logger.getLogger(PlusServiceImpl.class);
	
	@Autowired
	private PlusDao plusDao;
}
