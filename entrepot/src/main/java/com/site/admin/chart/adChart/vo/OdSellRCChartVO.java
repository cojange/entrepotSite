package com.site.admin.chart.adChart.vo;

import java.util.Date;

public class OdSellRCChartVO {
	
	private String date;
	private String sell;
	private int refund;
	private int chg;
	private String od;

	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSell() {
		return sell;
	}
	public void setSell(String sell) {
		this.sell = sell;
	}
	
	
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public int getChg() {
		return chg;
	}
	public void setChg(int chg) {
		this.chg = chg;
	}
	public String getOd() {
		return od;
	}
	public void setOd(String od) {
		this.od = od;
	}
	@Override
	public String toString() {
		return "OdSellRCChartVO [date=" + date + ", sell=" + sell + ", refund=" + refund + ", chg=" + chg + ", od=" + od
				+ "]";
	}
	
	

}
