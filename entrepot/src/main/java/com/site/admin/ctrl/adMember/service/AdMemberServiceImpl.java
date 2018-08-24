package com.site.admin.ctrl.adMember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.ctrl.adMember.dao.AdMemberDao;
import com.site.admin.ctrl.adMember.vo.AdManagerVO;
import com.site.admin.ctrl.adMember.vo.AdMbCommonVO;

@Service
public class AdMemberServiceImpl implements AdMemberService{
	
	@Autowired
	private AdMemberDao adMemberDao;

	//관리자 리스트
	@Override
	public List<AdManagerVO> adminList(AdManagerVO amvo) {
		List<AdManagerVO> amList = adMemberDao.adminList(amvo);
		return amList;
	}

	//회원 리스트
	@Override
	public List<AdMbCommonVO> memberList(AdMbCommonVO ambcvo) {
		List<AdMbCommonVO> memberList = adMemberDao.memberList(ambcvo);
		return memberList;
	}
	
}
