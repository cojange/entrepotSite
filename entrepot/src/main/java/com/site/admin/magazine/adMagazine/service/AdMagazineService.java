package com.site.admin.magazine.adMagazine.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.site.admin.magazine.adMagazine.vo.MagazineSearchVO;
import com.site.client.magazine.ditail.vo.MagazineVO;

public interface AdMagazineService {

	public List<MagazineVO> adMagazineList(MagazineSearchVO msvo);
	public List<String> callMgPartner();
	public List<String>callMgNum(String com_name);
	public String insertMagazine(MagazineSearchVO msvo);
	public List<MagazineSearchVO> callDtKeyword();
	public String adDetailInsert(MagazineSearchVO msvo, HttpServletRequest request);

}
