package com.site.client.magazine.ditail.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.magazine.ditail.dao.DitailDao;

@Service
public class DitailServiceImpl implements DitailService {
	Logger logger = Logger.getLogger(DitailServiceImpl.class);

	@Autowired
	private DitailDao ditailDao;
}
