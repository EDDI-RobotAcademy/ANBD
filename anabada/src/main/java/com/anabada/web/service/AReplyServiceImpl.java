package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.AReplyDAO;
import com.anabada.web.vo.AReplyVO;

@Service
public class AReplyServiceImpl implements AReplyService {

	@Inject
	private AReplyDAO dao;
	
	//댓글 목록
	@Override
	public List<AReplyVO> readReply(int a_bno) throws Exception {
		return dao.readReply(a_bno);
	}
	
	//댓글 작성
	@Override
	public void writeReply(AReplyVO replyVO) throws Exception {
		dao.writeReply(replyVO);
	}

	//댓글 조회
	@Override
	public AReplyVO selectReply(int r_rno) throws Exception {
		return dao.selectReply(r_rno);
	}
	
	//댓글 수정
	@Override
	public void updateReply(AReplyVO replyVO) throws Exception {
		dao.updateReply(replyVO);
	}
	
	//댓글 삭제
	@Override
	public int deleteReply(AReplyVO replyVO) throws Exception {
		return dao.deleteReply(replyVO.getR_rno());
	}


}
