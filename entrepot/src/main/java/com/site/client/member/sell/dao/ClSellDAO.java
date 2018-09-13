package com.site.client.member.sell.dao;

import com.site.client.member.myPage.vo.ClOrderListVO;
import com.site.client.member.sell.vo.ClRcVO;
import com.site.client.member.sell.vo.ClSellVO;

public interface ClSellDAO {
	
	public int paymentInsert(ClSellVO csvo);
	public int getOrder_Money(ClOrderListVO covo);
	public int orderListInsert(ClOrderListVO covo);
	public int paymentBack(ClSellVO csvo);
	public int refundInsert(ClRcVO rcvo);
	public int changeInsert(ClRcVO rcvo);
	public int getR_money(ClRcVO rcvo);
	public int getExtraPeriod(ClRcVO rcvo);
	public int getOrgPeriod(ClRcVO rcvo);
	public int getAd_money(ClRcVO rcvo);
	public int updateOrderf(ClRcVO rcvo);
	public int updateOrderc(ClRcVO rcvo);

}
