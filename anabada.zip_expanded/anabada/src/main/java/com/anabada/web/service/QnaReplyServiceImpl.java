package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.QnaReplyDAO;
import com.anabada.web.vo.QnaReplyVO;

@Service
public class QnaReplyServiceImpl implements QnaReplyService {

	@Inject
	private QnaReplyDAO dao;
	
	// 댓글 목록
	@Override
	public List<QnaReplyVO> readReply(int q_no) throws Exception {
		return dao.readReply(q_no);
	}

	// 댓글 작성
	@Override
	public void writeReply(QnaReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}

	// 댓글 수정
	@Override
	public void updateReply(QnaReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}

	// 댓글 삭제
	@Override
	public void deleteReply(QnaReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}

	// 선택된 댓글 조회
	@Override
	public QnaReplyVO selectReply(int qr_no) throws Exception {
		return dao.selectReply(qr_no);
	}

}
