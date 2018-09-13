package com.site.client.member.sell.service;

import com.site.client.member.sell.vo.ClMultiOrderListVO;
import com.site.client.member.sell.vo.ClRcVO;

public interface ClSellService {

	public int paymentInsert(ClMultiOrderListVO cmovo);
	public int refundInsert(ClRcVO rcvo);
	public int changeInsert(ClRcVO rcvo);
	
}
