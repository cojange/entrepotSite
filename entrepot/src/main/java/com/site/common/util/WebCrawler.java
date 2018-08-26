package com.site.common.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class WebCrawler {
	
	
	//url값
	private String url = "http://www.aladin.co.kr/shop/common/wbest.aspx?BestType=Bestseller&BranchType=1&CID=2913";
	//전체 dom을 담을 변수
	private Document doc = null;
	//bookbox를 담을 변순
	private Elements box = null;
	
	//생성지 connect
	public WebCrawler() {
		try {
			this.doc = Jsoup.connect(url).get();
		}catch(IOException e) {
			e.printStackTrace();
		}
		this.box = doc.select("div.ss_book_box");
	}
	
	//잡지 정보 list
	public List<String> getBook() {
		
		//bookinfo를 담을 list
		List<String> bookList = new ArrayList<>();
		//dom에서 태그찾기
		Elements element = this.box.select("div.ss_book_list");
		
		for(int i=0; i<element.size();i++) {
			bookList.add(element.get(i).select("b").text());
		}
		
		return bookList;
	}
	//이미지 urllist
	public List<String> getImg(){
		//이미지 url을 담을리스트
		List<String> imgList = new ArrayList<>();
		//이미지 태그 추출
		Elements img = this.box.select("img.i_cover");
		
		for(int i=0; i<img.size() ; i++) {
			imgList.add(img.get(i).attr("src"));
		}
		return imgList;
	}
	
}
