package com.site.admin.cost.adCost.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.cost.adCost.vo.AdCostVO;

@Repository
public class AdCostDaoImpl implements AdCostDao {
	
	@Autowired
	private SqlSession session;
	
	//파일 업로드시 db 입력
	@Override
	public int excelInsert(AdCostVO acvo) {
		return session.insert("excelInsert",acvo);
	}
	
	//card에뿌릴 파일명 가져오기
	@Override
	public AdCostVO selectCard(String keyword) {
		return session.selectOne("selectCard",keyword);
	}
	
	//card 클릭시 엑셀명 가져오기
	@Override
	public AdCostVO excelSelect(String month) {
		return session.selectOne("excelSelect",month);
	}

	//새로등록한 파일명 업데이트
	@Override
	public int excelUpdate(AdCostVO acvo) {
		return session.update("excelUpdate",acvo);
	}
	
	//통계에 쓸 excel 파일명 가져오기
	@Override
	public List<String> selectExcelList(int selectmonth){
		return session.selectList("selectExcelList",selectmonth);
	}

}
