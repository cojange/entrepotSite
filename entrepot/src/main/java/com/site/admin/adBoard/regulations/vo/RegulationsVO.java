package com.site.admin.adBoard.regulations.vo;

import org.springframework.web.multipart.MultipartFile;

import com.site.common.vo.CommonVO;

public class RegulationsVO extends CommonVO{
	private String reg_no;
	private String reg_file;
	private String reg_date;
	private String reg_update;
	private String reg_type;
	private String reg_open;
	private String reg_close;
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getReg_no() {
		return reg_no;
	}
	public void setReg_no(String reg_no) {
		this.reg_no = reg_no;
	}
	public String getReg_file() {
		return reg_file;
	}
	public void setReg_file(String reg_file) {
		this.reg_file = reg_file;
	} 
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getReg_update() {
		return reg_update;
	}
	public void setReg_update(String reg_update) {
		this.reg_update = reg_update;
	}
	public String getReg_type() {
		return reg_type;
	}
	public void setReg_type(String reg_type) {
		this.reg_type = reg_type;
	}
	public String getReg_open() {
		return reg_open;
	}
	public void setReg_open(String reg_open) {
		this.reg_open = reg_open;
	}
	public String getReg_close() {
		return reg_close;
	}
	public void setReg_close(String reg_close) {
		this.reg_close = reg_close;
	}
}
