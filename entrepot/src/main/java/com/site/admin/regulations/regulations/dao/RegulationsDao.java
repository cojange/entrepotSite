package com.site.admin.regulations.regulations.dao;

import java.util.List;

import com.site.admin.regulations.regulations.vo.RegAgreeVO;
import com.site.admin.regulations.regulations.vo.RegulationsVO;

public interface RegulationsDao {

	List<RegulationsVO> regList(RegulationsVO rvo);
	List<RegAgreeVO> regAgreeList(RegAgreeVO ravo);

}
