package com.anabada.web.service;

import java.util.List;

import com.anabada.web.vo.AReplyVO;

public interface AReplyService {
	
	//댓글 목록
	public List<AReplyVO> readReply(int a_bno) throws Exception;

	//댓글 작성
	public void writeReply(AReplyVO replyVO) throws Exception;

	//댓글 조회
	public AReplyVO selectReply(int r_rno) throws Exception;

	//댓글 수정
	public void updateReply(AReplyVO replyVO) throws Exception;
	
	//댓글 삭제
	public int deleteReply(AReplyVO replyVO) throws Exception;
}
