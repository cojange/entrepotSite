package com.site.client.board.useful.service;

import java.util.List;

import com.site.client.board.useful.vo.UsefulVO;

public interface UseFulService {
	public List<UsefulVO> usefulList(UsefulVO uvo);
	
	public UsefulVO usefulDetail(UsefulVO uvo);
}
