package com.site.admin.ctrl.adMember.vo;

public class AdMbPersnalVO extends AdMbCommonVO{
	

	private String m_birth;		//회원 생일
	private String m_gender;	//회원 성별
	private String grade;		//회원등급
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

}
