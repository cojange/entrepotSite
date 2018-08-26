package com.site.admin.ctrl.adMember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.ctrl.adMember.dao.AdMemberDao;
import com.site.admin.ctrl.adMember.vo.AdManagerVO;
import com.site.admin.ctrl.adMember.vo.AdMbCommonVO;
import com.site.admin.ctrl.adMember.vo.AdMbPersnalVO;

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

	//개인리스트
	@Override
	public List<AdMbCommonVO> pmList(AdMbCommonVO ambcvo) {
		System.out.println("mt : " + ambcvo.getMt());
		List<AdMbCommonVO> pmList;
		
		String key = ambcvo.getMt();
		//개인 회원 리스트
		if(key.equals("personal")) {
			pmList= adMemberDao.pmList(ambcvo);
		}else if(key.equals("group")) {
			//단체회원 리스트
			pmList= adMemberDao.gpList(ambcvo);
		}else return memberList(ambcvo);
		//전체는 원래 메서드로
		return pmList;
	}
	
}
