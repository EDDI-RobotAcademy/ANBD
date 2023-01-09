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
	
	@Override
	public List<AReplyVO> readReply(int a_bno) throws Exception {
		return dao.readReply(a_bno);
	}
	
	@Override
	public void writeReply(AReplyVO replyVO) throws Exception {
		dao.writeReply(replyVO);
	}

	@Override
	public AReplyVO selectReply(int r_rno) throws Exception {
		return dao.selectReply(r_rno);
	}

	@Override
	public int deleteReply(AReplyVO replyVO) throws Exception {
		return dao.deleteReply(replyVO.getR_rno());
	}

	@Override
	public void updateReply(AReplyVO replyVO) throws Exception {
		dao.updateReply(replyVO);
	}

}
