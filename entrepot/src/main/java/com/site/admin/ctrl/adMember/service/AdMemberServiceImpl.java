package com.site.admin.ctrl.adMember.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.ctrl.adMember.dao.AdMemberDao;
import com.site.admin.ctrl.adMember.vo.AdManagerVO;
import com.site.admin.ctrl.adMember.vo.AdMbCommonVO;
import com.site.admin.ctrl.adMember.vo.AdMbPersnalVO;
import com.site.admin.ctrl.adMember.vo.AdminVO;

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

	//id중복검사.
	@Override
	public String idCheck(AdminVO avo) {
		AdminVO resultVO = adMemberDao.idCheck(avo);
		String result="fail";
		
		if(resultVO == null) {
			result = "success";
		}
		return result;
	}
	//연락처 중복체크
	@Override
	public String tellCheck(AdminVO avo) {
		AdminVO resultVO = adMemberDao.tellCheck(avo);
		String  result = "fail";
		if(resultVO == null) {
			result="success";
		}
		return result;
	}
	//이메일 중복체크
	@Override
	public String emailCheck(AdminVO avo) {
		AdminVO resultVO = adMemberDao.emailCheck(avo);
		String result = "fail";
		if(resultVO == null) {
			result="success";
		}
		return result;
	}

	//admin 등록
	@Override
	public String insertAdmin(AdminVO avo) {
		
		//추후 암호화 등록 추가
		int result = adMemberDao.insertAdmin(avo);
		if(result==1) {
			return "success";
		}else {
			return "fails";
		}
	}

	@Override
	public String delAdmin(String ad_id) {
		int result = adMemberDao.delAdmin(ad_id);
		if(result==1) {
			return "success";
		}else {
			return "fails";
		}
	}



	
}
