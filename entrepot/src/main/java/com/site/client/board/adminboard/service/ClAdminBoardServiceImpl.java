package com.site.client.board.adminboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.board.adminboard.dao.ClAdminBoardDao;
import com.site.client.board.adminboard.vo.ClAdminBoardVO;
@Service
public class ClAdminBoardServiceImpl implements ClAdminBoardService{
	
	@Autowired
	private ClAdminBoardDao clAdminBoardDao;

	@Override
	public List<ClAdminBoardVO> adminboardList(ClAdminBoardVO advo) {
		List<ClAdminBoardVO>mylist =null;
		if(advo.getSearch()=="") {
			advo.setSearch("all");
		}
		mylist = clAdminBoardDao.adminboardList(advo);
		
		return mylist;
	}

	@Override
	public ClAdminBoardVO adminboardDetail(ClAdminBoardVO cavo) {
		ClAdminBoardVO detail = null;
		detail = clAdminBoardDao.adminboardDetail(cavo);
		return detail;
	}
}
