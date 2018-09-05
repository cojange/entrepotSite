package com.site.client.magazine.list.dao;

import java.util.List;

import com.site.client.magazine.ditail.vo.MagazineVO;
import com.site.client.member.myPage.vo.ClMyPageVO;

public interface ListDao {

	public List<MagazineVO> magazineList(MagazineVO mvo);

	public int listcount(MagazineVO mvo);

	public List<MagazineVO> bastlist(MagazineVO mvo);

	public List<MagazineVO> jlist(MagazineVO mvo);

	public List<MagazineVO> elist(MagazineVO mvo);

	public List<MagazineVO> aplist(MagazineVO mvo);

	public int cardcheck(ClMyPageVO pvo);

	public int cardinsert(ClMyPageVO pvo);

	public int cardupdate(ClMyPageVO pvo);

	


		
}
