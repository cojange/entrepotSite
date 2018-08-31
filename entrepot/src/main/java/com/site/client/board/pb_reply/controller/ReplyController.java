package com.site.client.board.pb_reply.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/replies")
public class ReplyController {
	Logger logger = Logger.getLogger(ReplyController.class);
	
	/*@Autowired
	private PersonalReplyService personalReplyService;*/
	
	/*//댓글 목록 구현
	@RequestMapping(value="/all/{pb_no}.do",method=RequestMethod.GET)
	public ResponseEntity<List<Pb_replyVO>>*/
}
