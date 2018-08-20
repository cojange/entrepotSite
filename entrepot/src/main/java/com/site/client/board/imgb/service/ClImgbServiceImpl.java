package com.site.client.board.imgb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.board.imgb.dao.ClImgbDao;

@Service
public class ClImgbServiceImpl implements ClImgbService{

	@Autowired
	private ClImgbDao clImgbDao;
	
	
}
