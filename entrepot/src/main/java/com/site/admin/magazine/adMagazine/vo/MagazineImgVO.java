package com.site.admin.magazine.adMagazine.vo;

public class MagazineImgVO {
	
	private String pl_path;
	private String pd_num;
	private String pl_type;
	private String mg_num;
	public String getPl_path() {
		return pl_path;
	}
	public void setPl_path(String pl_path) {
		this.pl_path = pl_path;
	}
	public String getPd_num() {
		return pd_num;
	}
	public void setPd_num(String pd_num) {
		this.pd_num = pd_num;
	}
	public String getPl_type() {
		return pl_type;
	}
	public void setPl_type(String pl_type) {
		this.pl_type = pl_type;
	}
	public String getMg_num() {
		return mg_num;
	}
	public void setMg_num(String mg_num) {
		this.mg_num = mg_num;
	}
	@Override
	public String toString() {
		return "MagazineImgVO [pl_path=" + pl_path + ", pd_num=" + pd_num + ", pl_type=" + pl_type + ", mg_num="
				+ mg_num + "]";
	}
	
	

}
