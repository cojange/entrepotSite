package com.site.admin.ctrl.adMember.dao;

import java.util.List;

import com.site.admin.ctrl.adMember.vo.AdManagerVO;
import com.site.admin.ctrl.adMember.vo.AdMbCommonVO;

public interface AdMemberDao {

	public List<AdManagerVO> adminList(AdManagerVO amvo);
	public List<AdMbCommonVO> memberList(AdMbCommonVO ambco);
}
