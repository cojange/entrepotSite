package com.site.client.member.sell.vo;

import java.util.List;

import com.site.client.member.myPage.vo.ClOrderListVO;

public class ClMultiOrderListVO {

	private List<ClOrderListVO> order_List;
	
	private ClSellVO sell;

	public List<ClOrderListVO> getOrder_List() {
		return order_List;
	}

	public void setOrder_List(List<ClOrderListVO> order_List) {
		this.order_List = order_List;
	}

	public ClSellVO getSell() {
		return sell;
	}

	public void setSell(ClSellVO sell) {
		this.sell = sell;
	}

	@Override
	public String toString() {
		return "ClMultiOrderListVO [order_List=" + order_List + ", sell=" + sell + "]";
	}
	
	
}
