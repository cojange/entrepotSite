package com.site.admin.ctrl.adMember.service;

import java.util.List;

import com.site.admin.ctrl.adMember.vo.AdManagerVO;
import com.site.admin.ctrl.adMember.vo.AdMbCommonVO;
import com.site.admin.ctrl.adMember.vo.AdMbPersnalVO;

public interface AdMemberService {
	public List<AdManagerVO> adminList(AdManagerVO amvo);
	public List<AdMbCommonVO> memberList(AdMbCommonVO ambcvo);
	public List<AdMbCommonVO> pmList(AdMbCommonVO ampvo);
}
