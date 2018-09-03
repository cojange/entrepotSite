package com.site.client.magazine.ditail.vo;

import com.site.client.member.login.vo.LoginVO;

public class PageVO{
   private int page = 1; //현재 페이지
   private int totalpage;   //총 패이지 개수
   private int countList;    //한페이지에 존재할 게시물 개수
   
   
   private int start;
   private int end;
   
   public int getStart() {
      return start;
   }
   public void setStart(int start) {
      this.start = start;
   }
   public int getEnd() {
      return end;
   }
   public void setEnd(int end) {
      this.end = end;
   }
   public int getPage() {
      return page;
   }
   public void setPage(int page) {
      this.page = page;
   }
   
   public int getTotalpage() {
      return totalpage;
   }
   public void setTotalpage(int totalpage) {
      this.totalpage = totalpage;
   }
   public int getCountList() {
      return countList;
   }
   public void setCountList(int countList) {
      this.countList = countList;
   }
   
   
}