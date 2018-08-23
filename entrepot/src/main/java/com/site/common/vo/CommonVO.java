package com.site.common.vo;

public class CommonVO {
	
		//검색
		private String search="";
		private String keyword="";
		private String start_date="";
		private	String end_date="";
		
		//리스트
		private String listkey="";
		private String key="";
		private String homename="";

		
		
		public String getHomename() {
			return homename;
		}
		public void setHomename(String homename) {
			this.homename = homename;
		}
		public String getStart_date() {
			return start_date;
		}
		public void setStart_date(String start_date) {
			this.start_date = start_date;
		}
		public String getListkey() {
			return listkey;
		}
		public void setListkey(String listkey) {
			this.listkey = listkey;
		}
		public String getKey() {
			return key;
		}
		public void setKey(String key) {
			this.key = key;
		}
		public String getEnd_date() {
			return end_date;
		}
		public void setEnd_date(String end_date) {
			this.end_date = end_date;
		}
		public String getSearch() {
			return search;
		}
		public void setSearch(String search) {
			this.search = search;
		}
		public String getKeyword() {
			return keyword;
		}
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		
		

}
