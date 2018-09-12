package com.site.client.member.sell.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.client.member.myPage.dao.ClMyPageDao;
import com.site.client.member.myPage.vo.ClMyPageVO;
import com.site.client.member.myPage.vo.ClOrderListVO;
import com.site.client.member.sell.dao.ClSellDAO;
import com.site.client.member.sell.vo.ClMultiOrderListVO;

@Service
public class ClSellServiceImpl implements ClSellService {
	
	@Autowired
	private ClSellDAO clSellDAO;
	@Autowired
	private ClMyPageDao clMyPageDao;

	@Override
	public int paymentInsert(ClMultiOrderListVO cmovo) {	
		int insertSellresult = 0;

		//전체 sell 테이블 insert
		 insertSellresult = clSellDAO.paymentInsert(cmovo.getSell());

		 
		 //String order_num = clSellDAO.getOrder_num(cmovo.getSell());
		
			if(insertSellresult==1) {
				
				//정보 주입 (vo 만들기)
				List<ClOrderListVO> odvoList = new ArrayList<>();
				ClOrderListVO odvo = null;
				for(int i=0; i<cmovo.getMg_numList().size();i++) {
					odvo = new ClOrderListVO();
					odvo.setOrder_num(cmovo.getSell().getOrder_num());
					odvo.setM_num(cmovo.getSell().getM_num());
					odvo.setPd_num(cmovo.getPd_numList().get(i));
					odvo.setOrder_ea(cmovo.getOrder_eaList().get(i));
					odvo.setOrder_money(cmovo.getOrder_moneyList().get(i));
					odvo.setMg_name(cmovo.getMg_numList().get(i));
					
					odvoList.add(odvo);
				}			
				//order_list insert
				for(ClOrderListVO od : odvoList) {
					clSellDAO.orderListInsert(od);
				}
				
				//범구 이부분 가능? 결제 완료후 장바구니 비우기 record번호 가져와서 주입만해주면 가능할듯?
				ClMyPageVO myPageVo = new ClMyPageVO();
				myPageVo.setRecord_num(cmovo.getRecord_num());
				System.out.println(cmovo.getRecord_num());
				clMyPageDao.listAllDelete(myPageVo);
				
			}else {
				clSellDAO.paymentBack(cmovo.getSell());
				return insertSellresult;
			}
			
			
		return 1;
	}

}
