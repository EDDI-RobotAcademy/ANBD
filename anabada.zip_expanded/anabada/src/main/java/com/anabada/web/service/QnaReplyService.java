package com.anabada.web.service;

import java.util.List;

import com.anabada.web.vo.QnaReplyVO;

public interface QnaReplyService {

	// 댓글 조회
	public List<QnaReplyVO> readReply(int q_no) throws Exception;
		
	// 댓글 작성
	public void writeReply(QnaReplyVO vo) throws Exception;
		
	// 댓글 수정
	public void updateReply(QnaReplyVO vo) throws Exception;
		
	// 댓글 삭제
	public void deleteReply(QnaReplyVO vo) throws Exception;
		
	// 선택된 댓글 조회
	public QnaReplyVO selectReply(int qr_no) throws Exception;
	
}
