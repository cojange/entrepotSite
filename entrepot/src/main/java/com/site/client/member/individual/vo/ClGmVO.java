package com.site.client.member.individual.vo;

import com.site.client.member.login.vo.LoginVO;
//개인회원
public class ClGmVO extends LoginVO{
	
	private String	com_no; //사업자 등록번호
	private String	leader_name; //대표자이름
	private String	leader_phone; //대표자전화번호
	private String	m_address; //주소
	private String	m_zipcode; //우편번호
	private String	char_name; //담당자 이름
	private String	char_phone; //담당자 전화번호
	private String	char_email; //담당자 이메일
	private String	acc_name; //회계 이름
	private String	acc_phone; //회계 전화번호
	private String	acc_email; //회계 이메일
	private String	m_date; //가입일
	private String	m_update; //수정일
	private String	fax; //팩스
	
		//private String m_num;//  	회원번호(loginVO 상속)
		//private String m_id =""; //회원아이디
		//private String m_pwd=""; //회원 비밀번호
		//private String m_name="";// 회원이름
		//private String whish;//	찜번호(loginVO 상속)
		//private String cart;//	장바구니번호(loginVO 상속)
		//private String mt;//		회원타입(loginVO 상속)
		//private String m_job;	//	직업-(loginVO 상속)

	
	private int mt_num; //회원타입번호
	

	public String getCom_no() {
		return com_no;
	}
	public void setCom_no(String com_no) {
		this.com_no = com_no;
	}
	public String getLeader_name() {
		return leader_name;
	}
	public void setLeader_name(String leader_name) {
		this.leader_name = leader_name;
	}
	public String getLeader_phone() {
		return leader_phone;
	}
	public void setLeader_phone(String leader_phone) {
		this.leader_phone = leader_phone;
	}
	public String getM_address() {
		return m_address;
	}
	public void setM_address(String m_address) {
		this.m_address = m_address;
	}
	public String getM_zipcode() {
		return m_zipcode;
	}
	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}
	public String getChar_name() {
		return char_name;
	}
	public void setChar_name(String char_name) {
		this.char_name = char_name;
	}
	public String getChar_phone() {
		return char_phone;
	}
	public void setChar_phone(String char_phone) {
		this.char_phone = char_phone;
	}
	public String getChar_email() {
		return char_email;
	}
	public void setChar_email(String char_email) {
		this.char_email = char_email;
	}
	public String getAcc_name() {
		return acc_name;
	}
	public void setAcc_name(String acc_name) {
		this.acc_name = acc_name;
	}
	public String getAcc_phone() {
		return acc_phone;
	}
	public void setAcc_phone(String acc_phone) {
		this.acc_phone = acc_phone;
	}
	public String getAcc_email() {
		return acc_email;
	}
	public void setAcc_email(String acc_email) {
		this.acc_email = acc_email;
	}
	
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public String getM_update() {
		return m_update;
	}
	public void setM_update(String m_update) {
		this.m_update = m_update;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}

	public int getMt_num() {
		return mt_num;
	}
	public void setMt_num(int mt_num) {
		this.mt_num = mt_num;
	}
	/*
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_name() {
		return m_name;
	}
	
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getMt() {
		return mt;
	}
	public void setMt(String mt) {
		this.mt = mt;
	}
	public String getWhish() {
		return whish;
	}
	public void setWhish(String whish) {
		this.whish = whish;
	}
	public String getCart() {
		return cart;
	}
	public void setCart(String cart) {
		this.cart = cart;
	public String getM_job() {
		return m_job;
	}
	public void setM_job(String m_job) {
		this.m_job = m_job;
	}
	}*/
	
	
	

	

}
