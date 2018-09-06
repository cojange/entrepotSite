package com.site.admin.order.orderList.vo;

public class AdRefundVO {
	
	private String r_num;
	private String m_num;
	private String r_ieu;
	private String bank;
	private String bank_num;
	private String order_num;
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getR_ieu() {
		return r_ieu;
	}
	public void setR_ieu(String r_ieu) {
		this.r_ieu = r_ieu;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getBank_num() {
		return bank_num;
	}
	public void setBank_num(String bank_num) {
		this.bank_num = bank_num;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	@Override
	public String toString() {
		return "AdRefundVO [r_num=" + r_num + ", r_ieu=" + r_ieu + ", order_num=" + order_num + ", bank=" + bank
				+ ", bank_num=" + bank_num + ", pd_num=" + ", m_num=" + m_num + "]";
	}
	
	

}
