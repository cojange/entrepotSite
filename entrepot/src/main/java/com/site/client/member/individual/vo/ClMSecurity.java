package com.site.client.member.individual.vo;
 //비밀번호 암호화
public class ClMSecurity { 
    private String m_id;
    private String salt;

	public ClMSecurity() { }

	public ClMSecurity(String m_id, String salt) {
		super();
		this.m_id = m_id;
		this.salt = salt;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@Override
	public String toString() {
		return "MemberSecurity [userId=" + m_id + ", salt=" + salt + "]";
	}
	
}