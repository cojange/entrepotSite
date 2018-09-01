package com.site.client.magazine.plus.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.site.client.magazine.ditail.vo.MagazineVO;
import com.site.client.magazine.plus.service.PlusService;
import com.site.client.magazine.plus.vo.PlusVO;

@Controller
@RequestMapping(value="/plus")
public class PlusController {
	Logger logger = Logger.getLogger(PlusController.class);
	
	@Autowired
	private PlusService plusService;
	/**************************************************************
	 * 댓글 글목록 구현하기
	 * @return List<ReplyVO>
	 * 참고: @PathVariable 는 URI의 경로에서 원하는 데이터를 추출하는 용도의 어노테이션
	 * 현재 요청 url: http://localhost:8080/replies/all/게시판글번호.do
	 * 예전 요청 url: http://localhost:8080/replues/replylist/do
	 * ?b_num=게시판글번호 
	 ******************************************************************/
		@RequestMapping(value="/all/{pd_num}.do",method=RequestMethod.GET)
		public ResponseEntity<List<PlusVO>> list(@PathVariable("pd_num")Integer pd_num){
			ResponseEntity<List<PlusVO>> entity =null;
			try {
				entity = new ResponseEntity<>(plusService.plusList(pd_num),HttpStatus.OK);
				
					
				
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
}
