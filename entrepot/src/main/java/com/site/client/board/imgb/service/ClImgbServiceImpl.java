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
		clImgbDao.clImgbCntUpdate(cvo.getImgb_no());
		
		clidetail = clImgbDao.imgbDetail(cvo);
		
		return clidetail;
	}
	@Override
	public int pwdConfirm(ClImgbVO cvo) {
		int pwd = 0;
		pwd=clImgbDao.pwdConfirm(cvo);
		return pwd;
	}
	@Override
	public int clImgbUpdate(ClImgbVO cvo) {
		int result =0;
		try {
			result =clImgbDao.clImgbUpdate(cvo);
		}catch(Exception e) {
			System.out.println("수정하는데 오류가 발생했습니다. 괸리자에게문의하세요");
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int clImgbDelete(int imgb_no) {
		int result = 0;
		try {
			result = clImgbDao.clImgbDelete(imgb_no);
		}catch(Exception e) {
			System.out.println("삭제하는데 오류가 있습니다 관리자에게 문의 하세요");
		}
		return result;
	}
   @Override
   public List<ClImgbVO> fotolist(ClImgbVO cvo){
	   List<ClImgbVO> fotolist =null;
	   fotolist = clImgbDao.fotolist(cvo);
	   return fotolist;
   }
   
}

