package com.site.client.member.login.vo;
//로그인정보
public class LoginVO extends LoginHistory{
	/** 회원의  로그인 id,비밀번호,이름,회원타입,을가져옴**/
	private String m_num;//회원번호
	private String m_id =""; //회원아이디
	private String m_pwd=""; //회원 비밀번호
	private String m_name="";// 회원이름
	private String mt=""; //회원 타입
	private String whish;//	찜번호
	private String cart;//	장바구니번호
	private String m_job;//직업,업종
	
	
	public LoginVO() {}

	

	public LoginVO(String m_num, String m_id, String m_pwd, String m_name, String mt, String whish, String cart,String m_job) {
		super();
		this.m_num = m_num;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
		this.mt = mt;
		this.whish = whish;
		this.cart = cart;
		this.m_job = m_job;
	}



	
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
	}



	public String getM_job() {
		return m_job;
	}



	public void setM_job(String m_job) {
		this.m_job = m_job;
	}
	
	
	
	
	
	
	
	
	
	
}