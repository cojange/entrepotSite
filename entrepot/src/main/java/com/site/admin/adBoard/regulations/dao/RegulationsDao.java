package com.site.admin.adBoard.regulations.dao;

import java.util.List;

import com.site.admin.adBoard.regulations.vo.RegAgreeVO;
import com.site.admin.adBoard.regulations.vo.RegulationsVO;

public interface RegulationsDao {

	List<RegulationsVO> regList(RegulationsVO rvo);
	List<RegAgreeVO> regAgreeList(RegAgreeVO ravo);
    
}
