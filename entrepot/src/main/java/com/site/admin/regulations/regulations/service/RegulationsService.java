package com.site.admin.regulations.regulations.service;

import java.util.List;

import com.site.admin.regulations.regulations.vo.RegAgreeVO;
import com.site.admin.regulations.regulations.vo.RegulationsVO;

public interface RegulationsService {

	List<RegulationsVO> regList(RegulationsVO rvo);
	List<RegAgreeVO> regAgreeList(RegAgreeVO ravo);

}
