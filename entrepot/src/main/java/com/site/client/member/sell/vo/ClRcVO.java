package com.site.client.member.sell.vo;

public class ClRcVO {
	private String order_num;
	private String pd_num;
	private String ieu="";
	private String usermemo="";
	private String ea;
	private String bank;
	private String bank_num;
	private int r_money;
	
	
	
	
	public int getR_money() {
		return r_money;
	}
	public void setR_money(int r_money) {
		this.r_money = r_money;
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
	public String getEa() {
		return ea;
	}
	public void setEa(String ea) {
		this.ea = ea;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getPd_num() {
		return pd_num;
	}
	public void setPd_num(String pd_num) {
		this.pd_num = pd_num;
	}
	public String getIeu() {
		return ieu;
	}
	public void setIeu(String ieu) {
		this.ieu = ieu;
	}
	public String getUsermemo() {
		return usermemo;
	}
	public void setUsermemo(String usermemo) {
		this.usermemo = usermemo;
	}
	@Override
	public String toString() {
		return "ClRcVO [order_num=" + order_num + ", pd_num=" + pd_num + ", ieu=" + ieu + ", usermemo=" + usermemo
				+ ", ea=" + ea + ", bank=" + bank + ", bank_num=" + bank_num + ", r_money=" + r_money + "]";
	}

	

}
