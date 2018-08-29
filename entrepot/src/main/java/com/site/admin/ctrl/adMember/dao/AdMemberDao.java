package com.site.admin.ctrl.adMember.dao;

import java.util.List;

import com.site.admin.ctrl.adMember.vo.AdManagerVO;
import com.site.admin.ctrl.adMember.vo.AdMbCommonVO;
import com.site.admin.ctrl.adMember.vo.AdMbPersnalVO;
import com.site.admin.ctrl.adMember.vo.AdminVO;

public interface AdMemberDao {

	public List<AdManagerVO> adminList(AdManagerVO amvo);
	public List<AdMbCommonVO> memberList(AdMbCommonVO ambcvo);
	public List<AdMbCommonVO> pmList(AdMbCommonVO ambcvo);
	public List<AdMbCommonVO> gpList(AdMbCommonVO ambcvo);
	public AdminVO idCheck(AdminVO avo);
	public int insertAdmin(AdminVO avo);
}
