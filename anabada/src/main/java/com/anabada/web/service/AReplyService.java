package com.anabada.web.service;

import java.util.List;

import com.anabada.web.vo.AReplyVO;

public interface AReplyService {
	
	public List<AReplyVO> readReply(int a_bno) throws Exception;

	public void writeReply(AReplyVO replyVO) throws Exception;

	public AReplyVO selectReply(int r_rno) throws Exception;

	public void updateReply(AReplyVO replyVO) throws Exception;
	
	public int deleteReply(AReplyVO replyVO) throws Exception;
}
