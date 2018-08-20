package com.site.client.member.individual.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.individual.dao.ClMDao;

@Service
public class ClMServiceImpl implements ClMService {
		
	@Autowired
	private ClMDao clMDao;

	@Override
	public int userIdConfirm(String userId) {
		int result;
		if(clMDao.memberSelect(userId) != null) {
			result =1;
		}else {
			result =2;
		}
		return result;
	}
}
