package com.site.client.member.individual.vo;
 
public class ClMSecurity { 
    private String userId;
    private String salt;

	public ClMSecurity() { }

	public ClMSecurity(String userId, String salt) {
		super();
		this.userId = userId;
		this.salt = salt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	@Override
	public String toString() {
		return "MemberSecurity [userId=" + userId + ", salt=" + salt + "]";
	}
	
}