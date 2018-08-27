package com.site.admin.adBoard.regulations.service;

import java.util.List;

import com.site.admin.adBoard.regulations.vo.RegAgreeVO;
import com.site.admin.adBoard.regulations.vo.RegulationsVO;

public interface RegulationsService {

	List<RegulationsVO> regList(RegulationsVO rvo);
	List<RegAgreeVO> regAgreeList(RegAgreeVO ravo);
 
}
