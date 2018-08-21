package com.site.admin.ctrl.adMember.vo;

public class AdManagerVO {
	
	private String ad_id;
	private String ad_pw;
	private String ad_tell;
	private String ad_name;
	private String ad_email;
	private String ad_date;
	private String com_no; 
	private String ad_grade;
	
	@Override
	public String toString() {
		return "AdManagerVO [ad_id=" + ad_id + ", ad_pw=" + ad_pw + ", ad_tell=" + ad_tell + ", ad_name=" + ad_name
				+ ", ad_email=" + ad_email + ", ad_date=" + ad_date + ", com_no=" + com_no + ", ad_grade=" + ad_grade
				+ "]";
	}
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_pw() {
		return ad_pw;
	}
	public void setAd_pw(String ad_pw) {
		this.ad_pw = ad_pw;
	}
	public String getAd_tell() {
		return ad_tell;
	}
	public void setAd_tell(String ad_tell) {
		this.ad_tell = ad_tell;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public String getAd_email() {
		return ad_email;
	}
	public void setAd_email(String ad_email) {
		this.ad_email = ad_email;
	}
	public String getAd_date() {
		return ad_date;
	}
	public void setAd_date(String ad_date) {
		this.ad_date = ad_date;
	}
	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public String getAd_grade() {
		return ad_grade;
	}
	public void setAd_grade(String ad_grade) {
		this.ad_grade = ad_grade;
	}
}
