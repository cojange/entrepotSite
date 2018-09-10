package com.site.client.member.sell.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.myPage.dao.ClMyPageDao;
import com.site.client.member.myPage.vo.ClOrderListVO;
import com.site.client.member.sell.dao.ClSellDAO;
import com.site.client.member.sell.vo.ClMultiOrderListVO;
import com.site.client.member.sell.vo.ClSellVO;

@Service
public class ClSellServiceImpl implements ClSellService {
	
	@Autowired
	private ClSellDAO clSellDAO;
	@Autowired
	private ClMyPageDao clMyPageDao;

	@Override
	public int paymentInsert(ClMultiOrderListVO cmovo) {	
		int insertSellresult = 0;
		int resultDelete = 0;
		int insertOrderList = 0;
		//전체 sell 테이블 insert
		insertSellresult = clSellDAO.paymentInsert(cmovo.getSell());
			if(insertSellresult==1) {
				
				//sell 테이블에 insert 성공시 장바구니 비우기
				resultDelete = clMyPageDao.listAllDelete();
				
				//단품 단가 주입
				for(ClOrderListVO covo : cmovo.getOrder_List()) {
					covo.setOrder_money(String.valueOf(clSellDAO.getOrder_Money(covo)));
				}
				
				//order_list 테이블 insert
				for(int i=0; i<cmovo.getOrder_List().size();i++) {
					insertOrderList = clSellDAO.orderListInsert(cmovo.getOrder_List().get(i));	
				}
				
				
			}else if(insertSellresult != 1) {
				return insertSellresult;
			}
			
			
		return result;
	}

}
