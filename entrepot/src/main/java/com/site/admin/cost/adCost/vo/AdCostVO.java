package com.site.admin.cost.adCost.vo;

import org.springframework.web.multipart.MultipartFile;

public class AdCostVO {
	private String cost_file="";
	private String ad_id;
	private String cardName;
	private String lastFile="";
	
	public String getLastFile() {
		return lastFile;
	}
	public void setLastFile(String lastFile) {
		this.lastFile = lastFile;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	private MultipartFile file;
	
	
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String getCost_file() {
		return cost_file;
	}
	public void setCost_file(String cost_file) {
		this.cost_file = cost_file;
	}
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	@Override
	public String toString() {
		return "adCostVO [cost_file=" + cost_file + ", ad_id=" + ad_id + "]";
	}
	
}
