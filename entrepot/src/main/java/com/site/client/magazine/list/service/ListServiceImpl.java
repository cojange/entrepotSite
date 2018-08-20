package com.site.client.magazine.list.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.magazine.list.dao.ListDao;

@Service
public class ListServiceImpl implements ListService {
	Logger logger = Logger.getLogger(ListService.class);
	
	@Autowired
	private ListDao listdao;
	
}
