package com.site.common.mail.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.site.common.mail.vo.EmailVO;

@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	 private JavaMailSender javaMailSender;

	@Override
	public String sendSimpleMail(EmailVO evo) {
		String result = "";
		  try{
		   SimpleMailMessage message = new SimpleMailMessage();

		   /*message.setFrom(evo.getFrom());
		   message.setTo(evo.getTo());
		   message.setSubject(evo.getSubject());
		   message.setText(evo.getText());*/
		   
		   /* 확인 작업 */
		   message.setFrom("jinsonju31@gmail.com");
		   message.setTo("jinsonjuju@naver.com");
		   message.setSubject("스프링으로 메일 발송 확인");
		   message.setText("스프링으로 메일 발송 테스트입니다.");
		   
		   javaMailSender.send(message);
		   result = "임시비밀번호가"+message.getTo()+"으로 발송되었습니다";
		  }catch(Exception e){
		   e.printStackTrace();
		   result = "이메일 발송에 필요한 데이터가 충족하지 못해서 정상적으로 발송하지 못하였습니다.";
		  }   
		  return result;
	}

/*	@Override
	public String sendMimeMail(EmailVO evo) {
		String result = "";
		  try{
		   MimeMessage message = mailSender.createMimeMessage();
		 
		   message.setFrom(new InternetAddress(evo.getFrom()));  
		   message.addRecipient(RecipientType.TO, new InternetAddress(evo.getTo()));
		   message.setSubject(evo.getSubject());
		   message.setText(evo.getText(), "utf-8", "html");
		   
		   message.setFrom(new InternetAddress("보내는사람 이메일"));  
		   message.addRecipient(RecipientType.TO, new InternetAddress("받는사람 이메일"));
		   message.setSubject("[공지] 회원 가입 안내");
		   message.setText("<h1>회원가입이 완료되었습니다!!</h1><h4>My Project에 오신것을 격하게 환영합니다~!!</h4>", "utf-8", "html");
		   
		   mailSender.send(message);
		   result = "성공적으로 이메일 발송이 완료되었습니다.";
		  }catch(Exception e){
		   e.printStackTrace();
		   result = "이메일 발송에 필요한 데이터가 충족하지 못해서 정상적으로 발송하지 못하였습니다.";
		  } 
		  return result;
		 }
	}*/
	 
	
}
