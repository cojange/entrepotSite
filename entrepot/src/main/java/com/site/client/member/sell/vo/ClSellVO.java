package com.site.client.member.sell.vo;

public class ClSellVO {
		
	
	private String	order_num;		//주문번호
	private String	sell_ea;		//총수량
	private String	sell_date;		//판매일
	private String	sell_money;		//총금액
	private String	bank_name;		//입금자명
	private String	bank;		//입금은행
	private String	coupon_no;		//쿠폰여부
	private String	m_num;		//회원번호
	private String	mt;		//회원타입
	private String	enddate;		//정기구독만료달
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getSell_ea() {
		return sell_ea;
	}
	public void setSell_ea(String sell_ea) {
		this.sell_ea = sell_ea;
	}
	public String getSell_date() {
		return sell_date;
	}
	public void setSell_date(String sell_date) {
		this.sell_date = sell_date;
	}
	public String getSell_money() {
		return sell_money;
	}
	public void setSell_money(String sell_money) {
		this.sell_money = sell_money;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getMt() {
		return mt;
	}
	public void setMt(String mt) {
		this.mt = mt;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "ClSellVO [order_num=" + order_num + ", sell_ea=" + sell_ea + ", sell_date=" + sell_date
				+ ", sell_money=" + sell_money + ", bank_name=" + bank_name + ", bank=" + bank + ", coupon_no="
				+ coupon_no + ", m_num=" + m_num + ", mt=" + mt + ", enddate=" + enddate + "]";
	}
	
	

}
