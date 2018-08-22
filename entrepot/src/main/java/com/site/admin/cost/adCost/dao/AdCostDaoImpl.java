package com.site.admin.cost.adCost.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.admin.cost.adCost.vo.AdCostVO;

@Repository
public class AdCostDaoImpl implements AdCostDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int excelInsert(AdCostVO acvo) {
		return session.insert("excelInsert",acvo);
	}

}