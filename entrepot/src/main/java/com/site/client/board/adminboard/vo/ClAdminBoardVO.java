package com.site.client.board.adminboard.vo;
import org.springframework.web.multipart.MultipartFile;

import com.site.common.vo.CommonVO;

public class ClAdminBoardVO extends CommonVO{
	private int ab_no					=0;
	private String ab_type				="";
	private String ab_title				="";
	private String ab_content			="";
	private MultipartFile file_thumb;
	private String ab_file				="";
	private String ab_date				="";
	private String ab_id				="";
	private String ab_pre				="";
	private String ab_update			="";
	private String ad_id				="";
	private int board_no				=0;
	
	
	public int getAb_no() {
		return ab_no;
	}
	public void setAb_no(int ab_no) {
		this.ab_no = ab_no;
	}
	public String getAb_type() {
		return ab_type;
	}
	public void setAb_type(String ab_type) {
		this.ab_type = ab_type;
	}
	public String getAb_title() {
		return ab_title;
	}
	public void setAb_title(String ab_title) {
		this.ab_title = ab_title;
	}
	public String getAb_content() {
		return ab_content;
	}
	public void setAb_content(String ab_content) {
		this.ab_content = ab_content;
	}
	public MultipartFile getFile_thumb() {
		return file_thumb;
	}
	public void setFile_thumb(MultipartFile file_thumb) {
		this.file_thumb = file_thumb;
	}
	public String getAb_file() {
		return ab_file;
	}
	public void setAb_file(String ab_file) {
		this.ab_file = ab_file;
	}
	public String getAb_date() {
		return ab_date;
	}
	public void setAb_date(String ab_date) {
		this.ab_date = ab_date;
	}
	public String getAb_id() {
		return ab_id;
	}
	public void setAb_id(String ab_id) {
		this.ab_id = ab_id;
	}
	public String getAb_pre() {
		return ab_pre;
	}
	public void setAb_pre(String ab_pre) {
		this.ab_pre = ab_pre;
	}
	public String getAb_update() {
		return ab_update;
	}
	public void setAb_update(String ab_update) {
		this.ab_update = ab_update;
	}
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
		
	
	
}
