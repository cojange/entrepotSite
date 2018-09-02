package com.site.admin.order.orderList.vo;

public class AdOrderProductVO {
	
	private String pd_num;
	private String pd_name;
	private String mcom_name;
	private String acc_manager;
	private String acc_tell;
	private String acc_email;
	private String total_ea;
	private String total_cost;
	private String memo;
	public String getPd_num() {
		return pd_num;
	}
	public void setPd_num(String pd_num) {
		this.pd_num = pd_num;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public String getMcom_name() {
		return mcom_name;
	}
	public void setMcom_name(String mcom_name) {
		this.mcom_name = mcom_name;
	}
	public String getAcc_manager() {
		return acc_manager;
	}
	public void setAcc_manager(String acc_manager) {
		this.acc_manager = acc_manager;
	}
	public String getAcc_tell() {
		return acc_tell;
	}
	public void setAcc_tell(String acc_tell) {
		this.acc_tell = acc_tell;
	}
	public String getAcc_email() {
		return acc_email;
	}
	public void setAcc_email(String acc_email) {
		this.acc_email = acc_email;
	}
	public String getTotal_ea() {
		return total_ea;
	}
	public void setTotal_ea(String total_ea) {
		this.total_ea = total_ea;
	}
	public String getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(String total_cost) {
		this.total_cost = total_cost;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	@Override
	public String toString() {
		return "AdOrderProductVO [pd_num=" + pd_num + ", pd_name=" + pd_name + ", mcom_name=" + mcom_name
				+ ", acc_manager=" + acc_manager + ", acc_tell=" + acc_tell + ", acc_email=" + acc_email + ", total_ea="
				+ total_ea + ", total_cost=" + total_cost + ", memo=" + memo + "]";
	}

	
}
