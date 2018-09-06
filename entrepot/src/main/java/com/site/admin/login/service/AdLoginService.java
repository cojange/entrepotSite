package com.site.admin.login.service;

import com.site.admin.ctrl.adMember.vo.AdminVO;

public interface AdLoginService {
	public AdminVO loginSelect(String ad_id, String ad_pw);
	
}
