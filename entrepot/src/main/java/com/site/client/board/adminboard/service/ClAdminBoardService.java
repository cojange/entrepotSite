package com.site.client.board.adminboard.service;

import java.util.List;

import com.site.client.board.adminboard.vo.ClAdminBoardVO;

public interface ClAdminBoardService {
	
	public List<ClAdminBoardVO> adminboardList(ClAdminBoardVO advo);
	
	public ClAdminBoardVO adminboardDetail(ClAdminBoardVO cavo);
}
