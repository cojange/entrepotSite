package com.site.client.magazine.ditail.vo;

import com.site.common.vo.CommonVO;

public class PageVO extends CommonVO {
	private int page = 1; //현재 페이지
	private int totalpage;   //총 패이지 개수
	private int countList;	 //한페이지에 존재할 게시물 개수
	
	private String ab_type; //공지타입
	private String ab_title; //공지제목
	private int ab_no; // 공지번호
	
	public int getAb_no() {
		return ab_no;
	}
	public void setAb_no(int ab_no) {
		this.ab_no = ab_no;
	}
	private int start;
	private int end;
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getCountList() {
		return countList;
	}
	public void setCountList(int countList) {
		this.countList = countList;
	}
	
	public String getAb_type() {
		return ab_type;
	}
	public void setAb_type(String ab_type) {
		this.ab_type = ab_type;
	}
	public String getAb_title() {
		return ab_title;
	}
	public void setAb_title(String ab_title) {
		this.ab_title = ab_title;
	}
}
