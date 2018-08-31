package com.site.admin.order.orderList.vo;

public class AdOrderListVO {

	private String pd_num;
	private String order_ea;
	private int order_money;
	private String order_ok;
	private String transit_num;
	public String getPd_num() {
		return pd_num;
	}
	public void setPd_num(String pd_num) {
		this.pd_num = pd_num;
	}
	public String getOrder_ea() {
		return order_ea;
	}
	public void setOrder_ea(String order_ea) {
		this.order_ea = order_ea;
	}
	public int getOrder_money() {
		return order_money;
	}
	public void setOrder_money(int order_money) {
		this.order_money = order_money;
	}
	public String getOrder_ok() {
		return order_ok;
	}
	public void setOrder_ok(String order_ok) {
		this.order_ok = order_ok;
	}
	public String getTransit_num() {
		return transit_num;
	}
	public void setTransit_num(String transit_num) {
		this.transit_num = transit_num;
	}
	@Override
	public String toString() {
		return "AdOrderListVO [pd_num=" + pd_num + ", order_ea=" + order_ea + ", order_money=" + order_money
				+ ", order_ok=" + order_ok + ", transit_num=" + transit_num + "]";
	}
	
	
}
