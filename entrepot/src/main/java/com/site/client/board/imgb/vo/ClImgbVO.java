package com.site.client.board.imgb.vo;

import org.springframework.web.multipart.MultipartFile;

import com.site.common.vo.CommonVO;

public class ClImgbVO extends CommonVO {

	//포토게시판
		private int imgb_no			=0; 	//이미지번호
		private String m_num		="";	//작성자
		private String imgb_title	="";	//이미지제목
		private String imgb_content	="";	//이미지내용
		private String imgb_pwd		="";	//비밀번호
		private String imgb_update	="";	//수정일
		private String imgb_date	="";	//등록일
		private String m_name		="";	//회원번호
		private int board_no		=0;
		private int imgb_cnt		=0;
		
		private MultipartFile file; //파일을 가져올 수 있는 자르 파일을 만들어서 파일을 가져오도록 하자
		private String file_thumb;
		private String imgb_img1		="";
		private String imgb_img2		="";
		private String imgb_img3		="";
		private String imgb_img4		="";
		private String imgb_img5		="";
		
		public int getImgb_no() {
			return imgb_no;
		}
		public void setImgb_no(int imgb_no) {
			this.imgb_no = imgb_no;
		}
		public String getM_num() {
			return m_num;
		}
		public void setM_num(String m_num) {
			this.m_num = m_num;
		}
		public String getImgb_title() {
			return imgb_title;
		}
		public void setImgb_title(String imgb_title) {
			this.imgb_title = imgb_title;
		}
		public String getImgb_content() {
			return imgb_content;
		}
		public void setImgb_content(String imgb_content) {
			this.imgb_content = imgb_content;
		}
		public String getImgb_pwd() {
			return imgb_pwd;
		}
		public void setImgb_pwd(String imgb_pwd) {
			this.imgb_pwd = imgb_pwd;
		}
		public String getImgb_update() {
			return imgb_update;
		}
		public void setImgb_update(String imgb_update) {
			this.imgb_update = imgb_update;
		}
		public String getImgb_date() {
			return imgb_date;
		}
		public void setImgb_date(String imgb_date) {
			this.imgb_date = imgb_date;
		}
		public String getM_name() {
			return m_name;
		}
		public void setM_name(String m_name) {
			this.m_name = m_name;
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
		public String getImgb_img1() {
			return imgb_img1;
		}
		public void setImgb_img1(String imgb_img1) {
			this.imgb_img1 = imgb_img1;
		}
		public String getImgb_img2() {
			return imgb_img2;
		}
		public void setImgb_img2(String imgb_img2) {
			this.imgb_img2 = imgb_img2;
		}
		public String getImgb_img3() {
			return imgb_img3;
		}
		public void setImgb_img3(String imgb_img3) {
			this.imgb_img3 = imgb_img3;
		}
		public String getImgb_img4() {
			return imgb_img4;
		}
		public void setImgb_img4(String imgb_img4) {
			this.imgb_img4 = imgb_img4;
		}
		public String getImgb_img5() {
			return imgb_img5;
		}
		public void setImgb_img5(String imgb_img5) {
			this.imgb_img5 = imgb_img5;
		}
		public int getBoard_no() {
			return board_no;
		}
		public void setBoard_no(int board_no) {
			this.board_no = board_no;
		}
		public int getImgb_cnt() {
			return imgb_cnt;
		}
		public void setImgb_cnt(int imgb_cnt) {
			this.imgb_cnt = imgb_cnt;
		}
		
}
