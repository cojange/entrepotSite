package com.site.client.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.board.dao.ClImgbDao;

@Service
public class ClImgbServiceImpl {

	@Autowired
	private ClImgbDao clImgbDao;
}
