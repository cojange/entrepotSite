package com.site.client.magazine.ditail.vo;

public class MagazineVO  {
	
	//상품테이블 (product)
	private String pd_num;                  	//상품코드
	private int pd_rate;						//할인율
	private	int pd_sale;						//정가
	private	int pd_cost;                    	//원가	               
	private	String pd_appendix;					//부록여부
	private	String pd_date;						//출간일

	//잡지별 테이블(Magzine)
	private String mg_num;						//잡지코드
	private String mg_period;					//출간주기
	private String mg_name;						//잡지명
	private String com_no;						//사업자번호
	
	//상품이미지 테이블(product_image)
	private String pl_path;						//파일경로
	private String pl_type;						//파일유형	
	
	
	//상품상세 테이블(details)
	private	String dt_terget;					//대상
	private	String dt_brief;					//간략소개
	private String dt_detail;					//상품상세
	private String dt_contents;					//목차
	private String dt_keyword;					//키워드
	public String getPd_num() {
		return pd_num;
	}
	public void setPd_num(String pd_num) {
		this.pd_num = pd_num;
	}
	public int getPd_rate() {
		return pd_rate;
	}
	public void setPd_rate(int pd_rate) {
		this.pd_rate = pd_rate;
	}
	public int getPd_sale() {
		return pd_sale;
	}
	public void setPd_sale(int pd_sale) {
		this.pd_sale = pd_sale;
	}
	public int getPd_cost() {
		return pd_cost;
	}
	public void setPd_cost(int pd_cost) {
		this.pd_cost = pd_cost;
	}
	public String getPd_appendix() {
		return pd_appendix;
	}
	public void setPd_appendix(String pd_appendix) {
		this.pd_appendix = pd_appendix;
	}
	public String getPd_date() {
		return pd_date;
	}
	public void setPd_date(String pd_date) {
		this.pd_date = pd_date;
	}
	public String getMg_num() {
		return mg_num;
	}
	public void setMg_num(String mg_num) {
		this.mg_num = mg_num;
	}
	public String getMg_period() {
		return mg_period;
	}
	public void setMg_period(String mg_period) {
		this.mg_period = mg_period;
	}
	public String getMg_name() {
		return mg_name;
	}
	public void setMg_name(String mg_name) {
		this.mg_name = mg_name;
	}
	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public String getPl_path() {
		return pl_path;
	}
	public void setPl_path(String pl_path) {
		this.pl_path = pl_path;
	}
	public String getPl_type() {
		return pl_type;
	}
	public void setPl_type(String pl_type) {
		this.pl_type = pl_type;
	}
	public String getDt_terget() {
		return dt_terget;
	}
	public void setDt_terget(String dt_terget) {
		this.dt_terget = dt_terget;
	}
	public String getDt_brief() {
		return dt_brief;
	}
	public void setDt_brief(String dt_brief) {
		this.dt_brief = dt_brief;
	}
	public String getDt_detail() {
		return dt_detail;
	}
	public void setDt_detail(String dt_detail) {
		this.dt_detail = dt_detail;
	}
	public String getDt_contents() {
		return dt_contents;
	}
	public void setDt_contents(String dt_contents) {
		this.dt_contents = dt_contents;
	}
	public String getDt_keyword() {
		return dt_keyword;
	}
	public void setDt_keyword(String dt_keyword) {
		this.dt_keyword = dt_keyword;
	}
	
	
}
