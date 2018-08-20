package com.site.client.magazine.plus.vo;

public class PlusVO  {	
	//상품댓글게시판(plus)
	private String pl_num; 				//게시물 넘버
	private	String pd_num;				//상품코드
	private String pl_update;			//수정일
	private int pl_star;				//별점평균
	private String pl_date;				//등록일
	private	String pl_pwd;				//덧글비밀번호
	private String pl_product;			//상품내용
	private String pl_parcel;			//택배내용
	private String m_num;				//회원번호
	private int board_no;				//게시판번호
	
	//추천.비추천 테이블(recommendation)
	private String cm_num; 				//추천번호
	private String cm_choice;			//추/비추
	
	
	public String getPl_num() {
		return pl_num;
	}
	public void setPl_num(String pl_num) {
		this.pl_num = pl_num;
	}
	public String getPd_num() {
		return pd_num;
	}
	public void setPd_num(String pd_num) {
		this.pd_num = pd_num;
	}
	public String getPl_update() {
		return pl_update;
	}
	public void setPl_update(String pl_update) {
		this.pl_update = pl_update;
	}
	public int getPl_star() {
		return pl_star;
	}
	public void setPl_star(int pl_star) {
		this.pl_star = pl_star;
	}
	public String getPl_date() {
		return pl_date;
	}
	public void setPl_date(String pl_date) {
		this.pl_date = pl_date;
	}
	public String getPl_pwd() {
		return pl_pwd;
	}
	public void setPl_pwd(String pl_pwd) {
		this.pl_pwd = pl_pwd;
	}
	public String getPl_product() {
		return pl_product;
	}
	public void setPl_product(String pl_product) {
		this.pl_product = pl_product;
	}
	public String getPl_parcel() {
		return pl_parcel;
	}
	public void setPl_parcel(String pl_parcel) {
		this.pl_parcel = pl_parcel;
	}
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getCm_num() {
		return cm_num;
	}
	public void setCm_num(String cm_num) {
		this.cm_num = cm_num;
	}
	public String getCm_choice() {
		return cm_choice;
	}
	public void setCm_choice(String cm_choice) {
		this.cm_choice = cm_choice;
	}
	
	
	
}
