package com.site.client.member.sell.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.site.client.member.sell.vo.ClSellVO;

@Repository
public class ClSellDAOImpl implements ClSellDAO {
	
	@Autowired
	private SqlSession session;

	@Override
	public int paymentInsert(ClSellVO csvo) {
		return session.insert("paymentInsert",csvo);
	}


}
