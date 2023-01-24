package com.anabada.web.dao;

import java.util.List;

import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.AReplyVO;
import com.anabada.web.vo.ASearchCriteria;

public interface AReplyDAO {

	//댓글 목록
	public List<AReplyVO> readReply(int a_bno) throws Exception;

	//댓글 작성
	public void writeReply(AReplyVO replyVO) throws Exception;

	//댓글 조회
	public AReplyVO selectReply(int r_rno) throws Exception;

	//댓글 수정
	public void updateReply(AReplyVO replyVO) throws Exception;

	//댓글 삭제
	public int deleteReply(int replyVO) throws Exception;

	//마이페이지 내가 작성한 댓글 목록
	public List<AReplyVO> myReplyList(ASearchCriteria scri) throws Exception;

	//마이페이지 내가 작성한 댓글 개수
	public int replyListCount(ASearchCriteria scri) throws Exception;

	//마이페이지 내가 작성한 댓글의 게시물
	public ABoardVO myReplyTitle(int a_bno) throws Exception;

}
