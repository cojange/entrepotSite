package com.site.client.board.pb_reply.service;

import java.util.List;

import com.site.client.board.pb_reply.vo.Pb_replyVO;

public interface ReplyService {
	public List<Pb_replyVO> replyList(Integer pb_no);

}
