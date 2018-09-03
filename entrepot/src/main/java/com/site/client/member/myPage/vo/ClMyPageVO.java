package com.site.client.member.myPage.vo;

import com.site.client.magazine.ditail.vo.MagazineVO;

public class ClMyPageVO extends MagazineVO{
	
	//찜,장바구니목록
	private String	record_num;		//찜_장바구니번호
	private String	mg_num;		//잡지코드
	private String	record_date;		//등록일
	private int	ea;		//찜&장바구니수량
	private int sum; //장바구니 합계
	
	
	
	public String getRecord_num() {
		return record_num;
	}
	public void setRecord_num(String record_num) {
		this.record_num = record_num;
	}
	public String getMg_num() {
		return mg_num;
	}
	public void setMg_num(String mg_num) {
		this.mg_num = mg_num;
	}
	public String getRecord_date() {
		return record_date;
	}
	public void setRecord_date(String record_date) {
		this.record_date = record_date;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	
	
	
	
	

}
