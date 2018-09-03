package com.site.admin.order.orderList.vo;

import java.sql.Date;

public class AdSellListVO {
	
	  private String order_num;
	  private String sell_ea;
	  private String sell_date;
	  private String enddate;
	  private int sell_money;
	  private String coupon_no;
	  private String m_num;
	  private String mt;
	  
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
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public int getSell_money() {
		return sell_money;
	}
	public void setSell_money(int sell_money) {
		this.sell_money = sell_money;
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
	@Override
	public String toString() {
		return "AdSellListVO [order_num=" + order_num + ", sell_ea=" + sell_ea + ", sell_date=" + sell_date
				+ ", enddate=" + enddate + ", sell_money=" + sell_money + ", coupon_no=" + coupon_no + ", m_num="
				+ m_num + ", mt=" + mt + "]";
	}
	  
	  
	
	
	

}
