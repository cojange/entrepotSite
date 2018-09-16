package com.site.admin.adBoard.personalBoard.vo;

public class PbReplyVO {
	private int pb_no;
	private int re_no;
    private String pbre_content;
    private String writer;
    private String pbre_date;
    
	public int getPb_no() {
		return pb_no;
	}
	public void setPb_no(int pb_no) {
		this.pb_no = pb_no;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getPbre_content() {
		return pbre_content;
	}
	public void setPbre_content(String pbre_content) {
		this.pbre_content = pbre_content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPbre_date() {
		return pbre_date;
	}
	public void setPbre_date(String pbre_date) {
		this.pbre_date = pbre_date;
	}
}
