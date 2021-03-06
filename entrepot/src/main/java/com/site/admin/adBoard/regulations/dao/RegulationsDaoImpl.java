package com.site.admin.adBoard.regulations.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.adBoard.regulations.vo.RegAgreeVO;
import com.site.admin.adBoard.regulations.vo.RegulationsVO;

@Repository
public class RegulationsDaoImpl implements RegulationsDao{

	@Autowired
	private SqlSession session;
	
	//약관 리스트
	@Override
	public List<RegulationsVO> regList(RegulationsVO rvo) {
		return session.selectList("regList", rvo);
	} 
	
	//약관동의 리스트
	@Override
	public List<RegAgreeVO> regAgreeList(RegAgreeVO ravo) {
		return session.selectList("regAgreeList", ravo);
	}

	@Override
	public int addRegulations(RegulationsVO rvo) {
		return session.insert("addRegulations", rvo);
	}

}
