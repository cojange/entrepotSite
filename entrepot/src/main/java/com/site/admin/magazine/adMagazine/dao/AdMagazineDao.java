package com.site.admin.magazine.adMagazine.dao;

import java.util.List;

import com.site.admin.magazine.adMagazine.vo.MagazineImgVO;
import com.site.admin.magazine.adMagazine.vo.MagazineSearchVO;
import com.site.client.magazine.ditail.vo.MagazineVO;

public interface AdMagazineDao {

	public List<MagazineVO> adMagazineList(MagazineSearchVO msvo);
	public List<String> callMgPartner();
	public List<String> callMgNum(String com_name);
	public int insertMagazine(MagazineSearchVO msvo);
	public List<MagazineSearchVO> callDtKeyword();
	public String getMgNum(MagazineSearchVO msvo);
	public String getPdNum(MagazineSearchVO msvo);
	public int insertDetailContent(MagazineSearchVO msvo);
	public int insertImgContent(MagazineImgVO mivo);
	public String selectPrevContent(MagazineSearchVO msvo);
	public int updateDetailContent(MagazineSearchVO msvo);
	
}
