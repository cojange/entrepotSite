package com.site.client.magazine.ditail.vo;

public class MagazineVO extends PageVO{
   
   //상품테이블 (product)
   private String pd_num;                     //상품코드
   private int pd_rate;                  //할인율
   private   int pd_sale;                  //정가
   private   int pd_cost;                       //원가                  
   private   String pd_appendix;               //부록여부
   private   String pd_date;                  //출간일

   //잡지별 테이블(Magzine)
   private String mg_num;                  //잡지코드
   private String mg_period;               //출간주기
   private String mg_name;                  //잡지명
   private String com_no;                  //사업자번호
   
   //상품이미지 테이블(product_image)
   private String pl_path;                  //파일경로
   private String pl_type;                  //파일유형   
   
   private String pl_path2;               //프리뷰
   
   //상품상세 테이블(details)
   
   private   String dt_target;               //대상
   private   String dt_brief;               //간략소개
   
   private String dt_detail;               //상품상세
   private String dt_contents;               //목차
   private String dt_keyword;               //키워드
   
   //필요 필드
   private int pd_salecost;     //할인가
   private String com_name;          //출판사
   private int listkey;      // 키워드 개수 판별
   private String home;         //리스트 제목
   
   private String key1;       //키워드1
   private String key2;      //키워드2
   private String key3;      //키워드3
   
   @Override
   public String toString() {
      return "MagazineVO [pd_num=" + pd_num + ", pd_rate=" + pd_rate + ", pd_sale=" + pd_sale + ", pd_cost=" + pd_cost
            + ", pd_appendix=" + pd_appendix + ", pd_date=" + pd_date + ", mg_num=" + mg_num + ", mg_period="
            + mg_period + ", mg_name=" + mg_name + ", com_no=" + com_no + ", pl_path=" + pl_path + ", pl_type="
            + pl_type + ", pl_path2=" + pl_path2 + ", dt_target=" + dt_target + ", dt_brief=" + dt_brief
            + ", dt_detail=" + dt_detail + ", dt_contents=" + dt_contents + ", dt_keyword=" + dt_keyword
            + ", pd_salecost=" + pd_salecost + ", com_name=" + com_name + ", listkey=" + listkey + ", home=" + home
            + ", key1=" + key1 + ", key2=" + key2 + ", key3=" + key3 + ", getPl_path2()=" + getPl_path2()
            + ", getKey1()=" + getKey1() + ", getKey2()=" + getKey2() + ", getKey3()=" + getKey3() + ", getHome()="
            + getHome() + ", getListkey()=" + getListkey() + ", getPd_salecost()=" + getPd_salecost()
            + ", getDt_target()=" + getDt_target() + ", getCom_name()=" + getCom_name() + ", getPd_num()="
            + getPd_num() + ", getPd_rate()=" + getPd_rate() + ", getPd_sale()=" + getPd_sale() + ", getPd_cost()="
            + getPd_cost() + ", getPd_appendix()=" + getPd_appendix() + ", getPd_date()=" + getPd_date()
            + ", getMg_num()=" + getMg_num() + ", getMg_period()=" + getMg_period() + ", getMg_name()="
            + getMg_name() + ", getCom_no()=" + getCom_no() + ", getPl_path()=" + getPl_path() + ", getPl_type()="
            + getPl_type() + ", getDt_terget()=" + getDt_terget() + ", getDt_brief()=" + getDt_brief()
            + ", getDt_detail()=" + getDt_detail() + ", getDt_contents()=" + getDt_contents() + ", getDt_keyword()="
            + getDt_keyword() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
            + super.toString() + "]";
   }
   public String getPl_path2() {
      return pl_path2;
   }
   public void setPl_path2(String pl_path2) {
      this.pl_path2 = pl_path2;
   }
   public String getKey1() {
      return key1;
   }
   public void setKey1(String key1) {
      this.key1 = key1;
   }
   public String getKey2() {
      return key2;
   }
   public void setKey2(String key2) {
      this.key2 = key2;
   }
   public String getKey3() {
      return key3;
   }
   public void setKey3(String key3) {
      this.key3 = key3;
   }

   public String getHome() {
      return home;
   }
   public void setHome(String home) {
      this.home = home;
   }
   public int getListkey() {
      return listkey;
   }
   public void setListkey(int listkey) {
      this.listkey = listkey;
   }
   public int getPd_salecost() {
      return pd_salecost;
   }
   public void setPd_salecost(int pd_salecost) {
      this.pd_salecost = pd_salecost;
   }

   public String getDt_target() {
      return dt_target;
   }
   public void setDt_target(String dt_target) {
      this.dt_target = dt_target;
   }
   public String getCom_name() {
      return com_name;
   }
   public void setCom_name(String com_name) {
      this.com_name = com_name;
   }
   public String getPd_num() {
      return pd_num;
   }
   public void setPd_num(String pd_num) {
      this.pd_num = pd_num;
   }
   public int getPd_rate() {
      return pd_rate;
   }
   public void setPd_rate(int pd_rate) {
      this.pd_rate = pd_rate;
   }
   public int getPd_sale() {
      return pd_sale;
   }
   public void setPd_sale(int pd_sale) {
      this.pd_sale = pd_sale;
   }
   public int getPd_cost() {
      return pd_cost;
   }
   public void setPd_cost(int pd_cost) {
      this.pd_cost = pd_cost;
   }
   public String getPd_appendix() {
      return pd_appendix;
   }
   public void setPd_appendix(String pd_appendix) {
      this.pd_appendix = pd_appendix;
   }
   public String getPd_date() {
      return pd_date;
   }
   public void setPd_date(String pd_date) {
      this.pd_date = pd_date;
   }
   public String getMg_num() {
      return mg_num;
   }
   public void setMg_num(String mg_num) {
      this.mg_num = mg_num;
   }
   public String getMg_period() {
      return mg_period;
   }
   public void setMg_period(String mg_period) {
      this.mg_period = mg_period;
   }
   public String getMg_name() {
      return mg_name;
   }
   public void setMg_name(String mg_name) {
      this.mg_name = mg_name;
   }
   public String getCom_no() {
      return com_no;
   }
   public void setCom_no(String com_no) {
      this.com_no = com_no;
   }
   public String getPl_path() {
      return pl_path;
   }
   public void setPl_path(String pl_path) {
      this.pl_path = pl_path;
   }
   public String getPl_type() {
      return pl_type;
   }
   public void setPl_type(String pl_type) {
      this.pl_type = pl_type;
   }
   public String getDt_terget() {
      return dt_target;
   }
   public void setDt_terget(String dt_terget) {
      this.dt_target = dt_terget;
   }
   public String getDt_brief() {
      return dt_brief;
   }
   public void setDt_brief(String dt_brief) {
      this.dt_brief = dt_brief;
   }
   public String getDt_detail() {
      return dt_detail;
   }
   public void setDt_detail(String dt_detail) {
      this.dt_detail = dt_detail;
   }
   public String getDt_contents() {
      return dt_contents;
   }
   public void setDt_contents(String dt_contents) {
      this.dt_contents = dt_contents;
   }
   public String getDt_keyword() {
      return dt_keyword;
   }
   public void setDt_keyword(String dt_keyword) {
      this.dt_keyword = dt_keyword;
   }
   
   
}