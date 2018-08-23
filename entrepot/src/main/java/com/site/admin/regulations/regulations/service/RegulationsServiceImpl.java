package com.site.admin.regulations.regulations.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.admin.regulations.regulations.dao.RegulationsDao;
import com.site.admin.regulations.regulations.vo.RegAgreeVO;
import com.site.admin.regulations.regulations.vo.RegulationsVO;

@Service
public class RegulationsServiceImpl implements RegulationsService {

	@Autowired
	private RegulationsDao regulationsDao;
	
	//약관 리스트
	@Override
	public List<RegulationsVO> regList(RegulationsVO rvo) {
		List<RegulationsVO> regList = null;
		regList = regulationsDao.regList(rvo);
		return regList;
	}
	
	//약관동의 리스트
	@Override
	public List<RegAgreeVO> regAgreeList(RegAgreeVO ravo) {
		List<RegAgreeVO> regAgreeList = null;
		regAgreeList = regulationsDao.regAgreeList(ravo);
		return regAgreeList;
	}

}
