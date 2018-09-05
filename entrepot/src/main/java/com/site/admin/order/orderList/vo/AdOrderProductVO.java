package com.site.admin.order.orderList.vo;

public class AdOrderProductVO {
	
	private String pd_num;
	private String mg_name;
	private String mcom_name;

	private String char_manager;
	private String char_tel;
	private String char_email;
	private String total_ea;
	private String total_cost;
	private String memo;
	public String getPd_num() {
		return pd_num;
	}
	public void setPd_num(String pd_num) {
		this.pd_num = pd_num;
	}
	public String getMg_name() {
		return mg_name;
	}
	public void setMg_name(String mg_name) {
		this.mg_name = mg_name;
	}

	public String getMcom_name() {
		return mcom_name;
	}
	public void setMcom_name(String mcom_name) {
		this.mcom_name = mcom_name;
	}
	
	public String getChar_manager() {
		return char_manager;
	}
	public void setChar_manager(String char_manager) {
		this.char_manager = char_manager;
	}


	public String getChar_tel() {
		return char_tel;
	}
	public void setChar_tel(String char_tel) {
		this.char_tel = char_tel;
	}
	public String getChar_email() {
		return char_email;
	}
	public void setChar_email(String char_email) {
		this.char_email = char_email;
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
		return "AdOrderProductVO [pd_num=" + pd_num + ", mg_name=" + mg_name + ", mcom_name=" + mcom_name
				+ ", char_manager=" + char_manager + ", char_tel=" + char_tel + ", char_email=" + char_email + ", total_ea="
				+ total_ea + ", total_cost=" + total_cost + ", memo=" + memo + "]";
	}

	
}
