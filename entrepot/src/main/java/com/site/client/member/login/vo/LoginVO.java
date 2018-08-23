package com.site.client.member.login.vo;

public class LoginVO extends LoginHistory{
	/** 회원의  로그인 id,비밀번호,이름을가져옴**/
	private String m_id ="";
	private String m_pwd="";
	private String m_name="";
	
	public LoginVO() {}

	public LoginVO(String m_id, String m_pwd, String m_name) {
		super();
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
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
	
	
	
	
}