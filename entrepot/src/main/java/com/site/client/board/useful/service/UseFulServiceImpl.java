package com.site.client.board.useful.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.board.useful.dao.UseFulDao;
import com.site.client.board.useful.vo.UsefulVO;

@Service
public class UseFulServiceImpl implements UseFulService{
	Logger logger = Logger.getLogger(UseFulServiceImpl.class);
	 
	@Autowired
	private UseFulDao useFulDao;
	
	
	@Override
	public List<UsefulVO> usefulList(UsefulVO uvo) {
		List<UsefulVO>mylist=null;
		if(uvo.getSearch()=="") {
			uvo.setSearch("all");
		}
		mylist = useFulDao.usefulList(uvo);
		
		return mylist;
	}


	@Override
	public UsefulVO usefulDetail(UsefulVO uvo) {
		UsefulVO detail = null;
		detail = useFulDao.usefulDetail(uvo);
		return detail;
	}

}
