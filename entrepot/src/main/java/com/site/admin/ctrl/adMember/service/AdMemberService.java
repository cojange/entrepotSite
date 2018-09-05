package com.site.admin.ctrl.adMember.service;

import java.util.List;

import com.site.admin.ctrl.adMember.vo.AdManagerVO;
import com.site.admin.ctrl.adMember.vo.AdMbCommonVO;
import com.site.admin.ctrl.adMember.vo.AdMbPersnalVO;
import com.site.admin.ctrl.adMember.vo.AdminVO;

public interface AdMemberService {
	public List<AdManagerVO> adminList(AdManagerVO amvo);
	public List<AdMbCommonVO> memberList(AdMbCommonVO ambcvo);
	public List<AdMbCommonVO> pmList(AdMbCommonVO ampvo);
	public String idCheck(AdminVO avo);
	public String insertAdmin(AdminVO avo);
	public String tellCheck(AdminVO avo);
	public String emailCheck(AdminVO avo);
	public String delAdmin(String ad_id);
}
