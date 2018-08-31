package com.site.client.magazine.ditail.service;

import java.util.List;

import com.site.client.magazine.ditail.vo.MagazineVO;

public interface DitailService {

	public MagazineVO magazineDetail(MagazineVO mvo);

	public List<MagazineVO> magazinesum(MagazineVO magazine);

	public List<MagazineVO> magazineDetailfree(MagazineVO magazine);

}
