package com.site.admin.order.orderList.vo;

import java.sql.Date;

public class AdMonthKeyVO {

	  private Date sDate;
	  private Date eDate;
	  private int monthkey;
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	public Date geteDate() {
		return eDate;
	}
	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}
	public int getMonthkey() {
		return monthkey;
	}
	public void setMonthkey(int monthkey) {
		this.monthkey = monthkey;
	}
	  
}
