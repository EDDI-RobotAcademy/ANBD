package com.anabada.web.dao;

import java.util.List;

import com.anabada.web.vo.AReplyVO;

public interface AReplyDAO {

	public List<AReplyVO> readReply(int a_bno) throws Exception;

	public void writeReply(AReplyVO replyVO) throws Exception;

	public AReplyVO selectReply(int r_rno) throws Exception;

	public void updateReply(AReplyVO replyVO) throws Exception;

	public int deleteReply(int replyVO) throws Exception;

}
