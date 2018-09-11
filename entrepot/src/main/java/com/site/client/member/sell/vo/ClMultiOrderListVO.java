package com.site.client.member.sell.vo;

import java.util.List;

import com.site.client.member.myPage.vo.ClOrderListVO;

public class ClMultiOrderListVO {

	private List<String> mg_numList;
	private List<String> pd_numList;
	private List<String> order_moneyList;
	private List<String> order_eaList;

	private ClSellVO sell;


	

	public List<String> getMg_numList() {
		return mg_numList;
	}

	public void setMg_numList(List<String> mg_numList) {
		this.mg_numList = mg_numList;
	}

	public List<String> getPd_numList() {
		return pd_numList;
	}

	public void setPd_numList(List<String> pd_numList) {
		this.pd_numList = pd_numList;
	}

	public List<String> getOrder_moneyList() {
		return order_moneyList;
	}

	public void setOrder_moneyList(List<String> order_moneyList) {
		this.order_moneyList = order_moneyList;
	}

	public List<String> getOrder_eaList() {
		return order_eaList;
	}

	public void setOrder_eaList(List<String> order_eaList) {
		this.order_eaList = order_eaList;
	}

	public ClSellVO getSell() {
		return sell;
	}

	public void setSell(ClSellVO sell) {
		this.sell = sell;
	}


	
	
}
