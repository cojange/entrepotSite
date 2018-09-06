package com.site.client.board.adminboard.dao;

import java.util.List;

import com.site.client.board.adminboard.vo.ClAdminBoardVO;

public interface ClAdminBoardDao {
	
	public List<ClAdminBoardVO> adminboardList(ClAdminBoardVO advo);
	
	public ClAdminBoardVO adminboardDetail(ClAdminBoardVO cavo);

}
