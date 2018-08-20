package com.site.admin.ctrl.adMember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.ctrl.adMember.dao.AdMemberDao;
import com.site.admin.ctrl.adMember.vo.AdManagerVO;

@Service
public class AdMemberServiceImpl implements AdMemberService{
	
	@Autowired
	private AdMemberDao adMemberDao;

	@Override
	public List<AdManagerVO> adminList(AdManagerVO amvo) {
		List<AdManagerVO> amList = adMemberDao.adminList(amvo);
		return amList;
	}
}
