package com.site.admin.order.orderList.vo;

public class AdChangeVO {
	private String chg_num;
	private String m_num;
	private String chg_ieu;
	private int chg_ea;
	private String chg_date;
	public String getChg_num() {
		return chg_num;
	}
	public void setChg_num(String chg_num) {
		this.chg_num = chg_num;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getChg_ieu() {
		return chg_ieu;
	}
	public void setChg_ieu(String chg_ieu) {
		this.chg_ieu = chg_ieu;
	}
	public int getChg_ea() {
		return chg_ea;
	}
	public void setChg_ea(int chg_ea) {
		this.chg_ea = chg_ea;
	}
	public String getChg_date() {
		return chg_date;
	}
	public void setChg_date(String chg_date) {
		this.chg_date = chg_date;
	}
	@Override
	public String toString() {
		return "AdChangeVO [chg_num=" + chg_num + ", m_num=" + m_num + ", chg_ieu=" + chg_ieu + ", chg_ea=" + chg_ea
				+ ", chg_date=" + chg_date + "]";
	}
	
	

}
