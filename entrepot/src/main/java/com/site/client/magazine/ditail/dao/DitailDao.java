package com.site.client.magazine.ditail.dao;

import java.util.List;

import com.site.client.magazine.ditail.vo.MagazineVO;

public interface DitailDao {

	public MagazineVO magazineDetail(MagazineVO mvo);

	public List<MagazineVO> magazinesum(MagazineVO magazine);

	public  List<MagazineVO> magazineDetailfree(MagazineVO magazine);

}
