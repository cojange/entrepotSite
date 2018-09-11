package com.site.admin.magazine.adMagazine.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.magazine.adMagazine.vo.MagazineImgVO;
import com.site.admin.magazine.adMagazine.vo.MagazineSearchVO;
import com.site.client.magazine.ditail.vo.MagazineVO;

@Repository
public class AdMagazineDaoImpl implements AdMagazineDao {
	@Autowired
	private SqlSession session;
	
	//상품 리스트 구현
	@Override
	public List<MagazineVO> adMagazineList(MagazineSearchVO msvo) {
		return session.selectList("adMagazineList", msvo);
	}
	
	@Override
	public List<String> callMgPartner(){
		return session.selectList("callMgPartner");
	}
	
	@Override
	public List<String> callMgNum(String com_name){
		return session.selectList("callMgNum",com_name);
	}
	
	@Override
	public int insertMagazine(MagazineSearchVO msvo) {
		return session.insert("insertMagazine",msvo);
	}

	//키워드 가져오기
	@Override
	public List<MagazineSearchVO> callDtKeyword() {
		return session.selectList("callDtKeyword");
	}

	//잡지 코드 가져오기
	@Override
	public String getMgNum(MagazineSearchVO msvo) {
		return session.selectOne("getMgNum",msvo);
	}
	
	//상품 코드 가져오기
	@Override
	public String getPdNum(MagazineSearchVO msvo) {
		return session.selectOne("getPdNum",msvo);
	}

	//content 등록
	@Override
	public int insertDetailContent(MagazineSearchVO msvo) {
		return session.insert("insertDetailContent", msvo);
	}
	
	//이미지 등록
	@Override
	public int insertImgContent(MagazineImgVO mivo) {
		return session.insert("insertImgContent", mivo);
	}

	@Override
	public String selectPrevContent(MagazineSearchVO msvo) {
		return session.selectOne("selectPrevContent",msvo);
	}

	@Override
	public int updateDetailContent(MagazineSearchVO msvo) {
		return session.update("updateDetailContent", msvo);
	}
}
