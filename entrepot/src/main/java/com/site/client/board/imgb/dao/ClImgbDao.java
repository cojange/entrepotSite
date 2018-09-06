package com.site.client.board.imgb.dao;

import java.util.List;

import com.site.client.board.imgb.vo.ClImgbVO;


public interface ClImgbDao {
   


public List<ClImgbVO> clImgbList(ClImgbVO cvo);
   
   public int imgbInsert(ClImgbVO cvo);
   
   public ClImgbVO imgbDetail(ClImgbVO cvo);

public List<ClImgbVO> fotolist(ClImgbVO cvo);
}