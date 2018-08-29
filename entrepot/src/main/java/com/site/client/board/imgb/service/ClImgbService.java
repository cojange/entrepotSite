package com.site.client.board.imgb.service;

import java.util.List;

import com.site.client.board.imgb.vo.ClImgbVO;



public interface ClImgbService {
	List<ClImgbVO>clImgbList (ClImgbVO cvo);
	
	public int imgbInsert(ClImgbVO cvo);
	
	public ClImgbVO imgbDetail(ClImgbVO cvo);
}
