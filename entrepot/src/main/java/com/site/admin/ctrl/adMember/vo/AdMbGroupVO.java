package com.site.admin.ctrl.adMember.vo;

public class AdMbGroupVO extends AdMbCommonVO{
	private String leader_name;	//리더네임
	private String char_name;	//담당자 이름
	private String com_no;		//사업자 등록번호
	private String acc_phone;	//회계부 번호
	private String acc_name;	//회계부 이름
	private String fax;			//팩스 번호
	
	private String[] columns = {"아이디","이름", "사업자번호", "기관", "이메일","연락처","등록일","수정일"};
			
	
	public String[] getColumns() {
		return columns;
	}
	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	public String getLeader_name() {
		return leader_name;
	}
	public void setLeader_name(String leader_name) {
		this.leader_name = leader_name;
	}
	public String getChar_name() {
		return char_name;
	}
	public void setChar_name(String char_name) {
		this.char_name = char_name;
	}
	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public String getAcc_phone() {
		return acc_phone;
	}
	public void setAcc_phone(String acc_phone) {
		this.acc_phone = acc_phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
}
