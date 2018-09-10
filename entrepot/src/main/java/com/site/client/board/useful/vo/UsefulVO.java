package com.site.client.board.useful.vo;

import com.site.common.vo.CommonVO;

public class UsefulVO  extends CommonVO{
	
	private int ub_no			=0;
	private String ub_type		="";
	private String ub_query		="";
	private String ub_ans		="";
	
	private String ub_date		="";
	private String ub_update	="";
	private int board_no		=0;
	private String ad_id		="";
	public int getUb_no() {
		return ub_no;
	}
	public void setUb_no(int ub_no) {
		this.ub_no = ub_no;
	}
	public String getUb_type() {
		return ub_type;
	}
	public void setUb_type(String ub_type) {
		this.ub_type = ub_type;
	}
	public String getUb_query() {
		return ub_query;
	}
	public void setUb_query(String ub_query) {
		this.ub_query = ub_query;
	}
	public String getUb_ans() {
		return ub_ans;
	}
	public void setUb_ans(String ub_ans) {
		this.ub_ans = ub_ans;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	public String getUb_update() {
		return ub_update;
	}
	public void setUb_update(String ub_update) {
		this.ub_update = ub_update;
	}
	public String getUb_date() {
		return ub_date;
	}
	public void setUb_date(String ub_date) {
		this.ub_date = ub_date;
	}
	
	
	
}
