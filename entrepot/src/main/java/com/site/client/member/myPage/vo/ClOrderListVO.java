package com.site.client.member.myPage.vo;

import com.site.client.member.sell.vo.ClSellVO;

public class ClOrderListVO extends ClSellVO{
	
	//주문내역
		private String	pd_num;		//	상품코드
		private String	order_date;		//	주문일
		private String	order_ea;		//	수량
		private String	order_money;		//	결제액
		private String	order_ok;		//	처리상태
		private String	transit_num;		//	운송번호
		private String  pd_cost;//잡지 개월수
		private String  mg_name;//잡지명
		
		public String getPd_num() {
			return pd_num;
		}
		public void setPd_num(String pd_num) {
			this.pd_num = pd_num;
		}
		public String getOrder_date() {
			return order_date;
		}
		public void setOrder_date(String order_date) {
			this.order_date = order_date;
		}
		public String getOrder_ea() {
			return order_ea;
		}
		public void setOrder_ea(String order_ea) {
			this.order_ea = order_ea;
		}
		public String getOrder_money() {
			return order_money;
		}
		public void setOrder_money(String order_money) {
			this.order_money = order_money;
		}
		public String getOrder_ok() {
			return order_ok;
		}
		public void setOrder_ok(String order_ok) {
			this.order_ok = order_ok;
		}
		public String getTransit_num() {
			return transit_num;
		}
		public void setTransit_num(String transit_num) {
			this.transit_num = transit_num;
		}
		public String getPd_cost() {
			return pd_cost;
		}
		public void setPd_cost(String pd_cost) {
			this.pd_cost = pd_cost;
		}
		public String getMg_name() {
			return mg_name;
		}
		public void setMg_name(String mg_name) {
			this.mg_name = mg_name;
		}
		
		
	

}
