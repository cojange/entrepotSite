package com.site.admin.adBoard.regulations.dao;

import java.util.List;

import com.site.admin.adBoard.regulations.vo.RegAgreeVO;
import com.site.admin.adBoard.regulations.vo.RegulationsVO;

public interface RegulationsDao {

	public List<RegulationsVO> regList(RegulationsVO rvo);
	public List<RegAgreeVO> regAgreeList(RegAgreeVO ravo);
	public int addRegulations(RegulationsVO rvo);
    
}
