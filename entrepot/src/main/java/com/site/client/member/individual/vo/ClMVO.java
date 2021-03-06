package com.site.client.member.individual.vo;

import com.site.client.member.login.vo.LoginVO;
//개인회원
public class ClMVO extends LoginVO{
	
	private String m_birth;//	생년월일-
	private String m_gender;		//	성별-
	private String m_address;		//	주소-
	private String m_zipcode;		//	우편번호
	private String m_phone;		//	회원전화번호-
	private String m_email;		//	이메일주소-
	private String m_date;		//	등록일
	private String m_update;	//	수정일
	private int pwdCheck;		//	비밀번호체크카운트
	private String black;		//	블랙리스트
	private String quiz;		//	비밀번호질문유형
	private String ans;		//	비밀번호질문답
	private String grade;		//	등급
	private String coupon_no;
	private int coupon_discount;
	
	private int mt_num; //회원타입번호
	
	//private String m_num;//  	회원번호(loginVO 상속)
	//private String m_id =""; //회원아이디
	//private String m_pwd=""; //회원 비밀번호
	//private String m_name="";// 회원이름
	//private String mt;//		회원타입(loginVO 상속)
	//private String whish;//	찜번호(loginVO 상속)
	//private String cart;//	장바구니번호(loginVO 상속)
	//private String m_job;	//	직업-(loginVO 상속)
	
	

	
	
	public String getM_birth() {
		return m_birth;
	}
	public String getCoupon_no() {
		return coupon_no;
	}
	public void setCoupon_no(String coupon_no) {
		this.coupon_no = coupon_no;
	}
	public int getCoupon_discount() {
		return coupon_discount;
	}
	public void setCoupon_discount(int coupon_discount) {
		this.coupon_discount = coupon_discount;
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
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
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
	public int getPwdCheck() {
		return pwdCheck;
	}
	public void setPwdCheck(int pwdCheck) {
		this.pwdCheck = pwdCheck;
	}
	public String getBlack() {
		return black;
	}
	public void setBlack(String black) {
		this.black = black;
	}
	public String getQuiz() {
		return quiz;
	}
	public void setQuiz(String quiz) {
		this.quiz = quiz;
	}
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getMt_num() {
		return mt_num;
	}
	public void setMt_num(int mt_num) {
		this.mt_num = mt_num;
	}
	/*public String getM_num() {
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
	}*/
	@Override
	public String toString() {
		return "ClMVO [m_birth=" + m_birth + ", m_gender=" + m_gender + ", m_address=" + m_address + ", m_zipcode="
				+ m_zipcode + ", m_phone=" + m_phone + ", m_email=" + m_email + ", m_date=" + m_date + ", m_update="
				+ m_update + ", pwdCheck=" + pwdCheck + ", black=" + black + ", quiz=" + quiz + ", ans=" + ans
				+ ", grade=" + grade + ", coupon_no=" + coupon_no + ", coupon_discount=" + coupon_discount + ", mt_num="
				+ mt_num + "]";
	}
	

	

}
