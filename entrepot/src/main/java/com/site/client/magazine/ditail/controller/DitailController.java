package com.site.client.magazine.ditail.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.client.magazine.ditail.service.DitailService;
import com.site.client.magazine.ditail.vo.MagazineVO;

@Controller
@RequestMapping(value="/client/ditail")
public class DitailController {
	Logger logger = Logger.getLogger(DitailController.class);
	@Autowired
	private DitailService ditailService;
	
	@RequestMapping(value="/magazineDetail.do" ,method=RequestMethod.GET)
	public String magazineDetail(MagazineVO mvo,Model model,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		
		MagazineVO magazine = new MagazineVO();
		magazine = ditailService.magazineDetail(mvo);
		List<MagazineVO> list= ditailService.magazinesum(magazine);
		List<MagazineVO> free = ditailService.magazineDetailfree(magazine);
		
		Cookie[] a =request.getCookies();
		/*if(a.length >2) {
			a[0].setValue(null);
			a[0].setMaxAge(0);
		}*/
		
		
		Cookie c1 = new Cookie(URLEncoder.encode("상품"+magazine.getMg_name(), "UTF-8"),magazine.getPl_path());
		
		c1.setMaxAge(60*60*24) ;
		c1.setPath("/");
		response.addCookie(c1);
		
		
		
		
		model.addAttribute("magazine",magazine);
		model.addAttribute("sumlist",list);
		model.addAttribute("free",free);
		model.addAttribute("mvo",mvo);
		if(mvo.getListkey()==1) {
			return "client/magazine/Overseas/magazineDitail";
		}else {		
			return "client/magazine/bast/magazineDitail";
		}
	
		
	}

	
}
