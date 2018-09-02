package com.site.client.board.pb_reply.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.site.client.board.pb_reply.vo.Pb_replyVO;

@RestController
@RequestMapping(value="/replies")
public class ReplyController {
	Logger logger = Logger.getLogger(ReplyController.class);
	
	/*@Autowired
	private PersonalReplyService personalReplyService;*/
	
	/*//댓글 목록 구현
	@RequestMapping(value="/all/{pb_no}.do",method=RequestMethod.GET)
	public ResponseEntity<List<Pb_replyVO>> list(@PathVariable("pb_no") Integer pb_no){
		ResponseEntity<List<Pb_replyVO>>entity = null;
		try {
			entity = new ResponseEntity<>(replyService.replyList("pb_no"),HttpStatus.OK);
		}catch(Exception e) {
			System.out.println("게시판 오류");
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}*/
}
