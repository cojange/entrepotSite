package com.site.client.board.imgb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.board.imgb.dao.ClImgbDao;
import com.site.client.board.imgb.vo.ClImgbVO;


@Service
public class ClImgbServiceImpl implements ClImgbService{

	@Autowired
	private ClImgbDao clImgbDao;

	@Override
	public List<ClImgbVO> clImgbList(ClImgbVO cvo) {
		List<ClImgbVO>myList = null;
		if(cvo.getSearch()=="") {
			cvo.setSearch("all");
		}
		myList = clImgbDao.clImgbList(cvo);
		return myList;
	}
		//글 입력 구현
	@Override
	public int imgbInsert(ClImgbVO cvo) {
		int result = 0;
		try {
			result = clImgbDao.imgbInsert(cvo);
		}catch(Exception e) {
			System.out.println("글 입력 오류입니다 관리자에게문의 하세요");
			e.printStackTrace();
		}
		return result;
	}
		//글 자세히 보기
	@Override
	public ClImgbVO imgbDetail(ClImgbVO cvo) {
		ClImgbVO clidetail = null;
		clidetail = clImgbDao.imgbDetail(cvo);
		
		return clidetail;
	}
	
	
}
