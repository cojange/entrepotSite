package com.site.admin.ctrl.adMember.dao;

import java.util.List;

import com.site.admin.ctrl.adMember.vo.AdManagerVO;

public interface AdMemberDao {

	public List<AdManagerVO> adminList(AdManagerVO amvo);
}
