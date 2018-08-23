package com.site.admin.adBoard.regulations.vo;

public class RegAgreeVO extends RegulationsVO {
	private String ag_no;
	private String m_num;
	private String ag_date;
	private String reg_no;
	
	private String m_name;
	private String m_id;
	private String mt;
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_id() {
		return m_id;
	} 
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getMt() {
		return mt;
	}
	public void setMt(String mt) {
		this.mt = mt;
	}
	
	
	public String getAg_no() {
		return ag_no;
	}
	public void setAg_no(String ag_no) {
		this.ag_no = ag_no;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getAg_date() {
		return ag_date;
	}
	public void setAg_date(String ag_date) {
		this.ag_date = ag_date;
	}
	public String getReg_no() {
		return reg_no;
	}
	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}
}
