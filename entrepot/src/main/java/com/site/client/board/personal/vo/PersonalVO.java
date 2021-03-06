package com.site.client.board.personal.vo;

import org.springframework.web.multipart.MultipartFile;

/*import com.site.client.member.login.vo.LoginVO;*/
import com.site.common.vo.CommonVO;

public class PersonalVO extends CommonVO  {
	//1대1 게시판
		private int pb_no			=0;
		private String m_name		="";
		private String pb_type		="";
		private String pb_title		="";
		private String pb_pwd		="";
		private String pb_content	="";
		private String update		="";
		private String pb_date		="";
		private String board_no		="";
		private String m_num		="";
		
		private MultipartFile file;
		private String file_thumb;
		private String pb_img1;
		private	String pb_img2;
		private String pb_img3;
		public int getPb_no() {
			return pb_no;
		}
		public void setPb_no(int pb_no) {
			this.pb_no = pb_no;
		}
		public String getM_name() {
			return m_name;
		}
		public void setM_name(String m_name) {
			this.m_name = m_name;
		}
		public String getPb_type() {
			return pb_type;
		}
		public void setPb_type(String pb_type) {
			this.pb_type = pb_type;
		}
		public String getPb_title() {
			return pb_title;
		}
		public void setPb_title(String pb_title) {
			this.pb_title = pb_title;
		}
		public String getPb_pwd() {
			return pb_pwd;
		}
		public void setPb_pwd(String pb_pwd) {
			this.pb_pwd = pb_pwd;
		}
		public String getPb_content() {
			return pb_content;
		}
		public void setPb_content(String pb_content) {
			this.pb_content = pb_content;
		}
		public String getUpdate() {
			return update;
		}
		public void setUpdate(String update) {
			this.update = update;
		}
		public String getPb_date() {
			return pb_date;
		}
		public void setPb_date(String pb_date) {
			this.pb_date = pb_date;
		}
		public String getBoard_no() {
			return board_no;
		}
		public void setBoard_no(String board_no) {
			this.board_no = board_no;
		}
		public String getM_num() {
			return m_num;
		}
		public void setM_num(String m_num) {
			this.m_num = m_num;
		}
		public MultipartFile getFile() {
			return file;
		}
		public void setFile(MultipartFile file) {
			this.file = file;
		}
		public String getFile_thumb() {
			return file_thumb;
		}
		public void setFile_thumb(String file_thumb) {
			this.file_thumb = file_thumb;
		}
		public String getPb_img1() {
			return pb_img1;
		}
		public void setPb_img1(String pb_img1) {
			this.pb_img1 = pb_img1;
		}
		public String getPb_img2() {
			return pb_img2;
		}
		public void setPb_img2(String pb_img2) {
			this.pb_img2 = pb_img2;
		}
		public String getPb_img3() {
			return pb_img3;
		}
		public void setPb_img3(String pb_img3) {
			this.pb_img3 = pb_img3;
		}
		
		
}
