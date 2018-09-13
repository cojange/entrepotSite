package com.site.common.mail.service;

import com.site.common.mail.vo.EmailVO;

public interface EmailService {
	public String sendSimpleMail(EmailVO evo);
}
