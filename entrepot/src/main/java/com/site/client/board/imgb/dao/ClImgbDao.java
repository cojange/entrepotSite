package com.site.client.board.imgb.dao;

import java.util.List;

import com.site.client.board.imgb.vo.ClImgbVO;


public interface ClImgbDao {
	
	public List<ClImgbVO> clImgbList(ClImgbVO cvo);
	
	public int imgbInsert(ClImgbVO cvo);
	
	public ClImgbVO imgbDetail(ClImgbVO cvo);
	
	public int pwdConfirm(ClImgbVO cvo);
	
	public int clImgbUpdate(ClImgbVO cvo);
	
	public int clImgbDelete(int imgb_no);
}
