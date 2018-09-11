package com.site.common.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ThumListVO {
	
	private List<MultipartFile> thumList;

	public List<MultipartFile> getThumList() {
		return thumList;
	}

	public void setThumList(List<MultipartFile> thumList) {
		this.thumList = thumList;
	}			

}
