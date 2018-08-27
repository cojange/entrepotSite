package com.site.common.util;

import java.util.Calendar;

public class GetDateUtil {

	private static GetDateUtil dateUtil;
	
	private GetDateUtil() {};
	
	public static GetDateUtil getInstance() {
		if(dateUtil == null) {
			dateUtil = new GetDateUtil();
		}
		return dateUtil;
	}
	
	private Calendar cal = Calendar.getInstance();
	//날짜+시간 반환
	public String getDate() {
		String yy = getYear();
		String mm = getMonth();
		String dd = getDay();
		
		String time = getTime();
		String today = getToday();
		
		return yy+"-"+mm+"-"+dd+" / "+time +" "+ today;
	}
	//년도 반환
	public String getYear() {
		String yy = String.valueOf(cal.get(Calendar.YEAR));
		return yy;
	}
	//월수 반환
	public String getMonth() {
		String mm = String.valueOf(cal.get(Calendar.MONTH)+1);
		if(mm.length()==1) {
			return "0"+mm;
		}
		return mm;
	}
	//일수 반환
	public String getDay() {
		String dd = String.valueOf(cal.get(Calendar.DAY_OF_MONTH));
		return dd;
	}
	//시간반환
	public String getTime() {
		String hh = String.valueOf(cal.get(Calendar.HOUR_OF_DAY));
		String mi = String.valueOf(cal.get(Calendar.MINUTE));
		String ss = String.valueOf(cal.get(Calendar.SECOND));
		
		return hh+" : "+mi+" : "+ss;
	}
	//요일반환
	public String getToday() {
		String day ="";
		int dayNum = cal.get(Calendar.DAY_OF_WEEK);
		switch(dayNum) {
		case 0:
			day="(일)";
			break;
		case 1:
			day="(월)";
			break;
		case 2:
			day="(화)";
			break;
		case 3:
			day="(수)";
			break;
		case 4:
			day="(목)";
			break;
		case 5:
			day="(금)";
			break;
		case 6:
			day="(토)";
			break;
		default:
			day="알수없음";
		}
		return day;
	}
}
