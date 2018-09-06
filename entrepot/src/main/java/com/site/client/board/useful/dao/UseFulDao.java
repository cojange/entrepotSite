package com.site.client.board.useful.dao;

import java.util.List;

import com.site.client.board.useful.vo.UsefulVO;

public interface UseFulDao {
	public List<UsefulVO> usefulList(UsefulVO uvo);
	
	public UsefulVO usefulDetail(UsefulVO uvo);

}
