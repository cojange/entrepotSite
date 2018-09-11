package com.site.client.member.sell.dao;

import com.site.client.member.myPage.vo.ClOrderListVO;
import com.site.client.member.sell.vo.ClSellVO;

public interface ClSellDAO {
	
	public int paymentInsert(ClSellVO csvo);
	public int getOrder_Money(ClOrderListVO covo);
	public int orderListInsert(ClOrderListVO covo);
	public int paymentBack(ClSellVO csvo);

}
