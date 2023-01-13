package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.AReplyVO;

@Repository
public class AReplyDAOImpl implements AReplyDAO {
	
	@Inject
	private SqlSession sql;
	
	//댓글 목록
	@Override
	public List<AReplyVO> readReply(int a_bno) throws Exception {
		return sql.selectList("replyMapper.readReply", a_bno);
	}

	//댓글 작성
	@Override
	public void writeReply(AReplyVO replyVO) throws Exception {
		sql.insert("replyMapper.writeReply", replyVO);
	}

	//댓글 조회
	@Override
	public AReplyVO selectReply(int r_rno) throws Exception {
		return sql.selectOne("replyMapper.selectReply", r_rno);
	}

	//댓글 수정
	@Override
	public void updateReply(AReplyVO replyVO) throws Exception {
		sql.update("replyMapper.updateReply", replyVO);
	}
	
	//댓글 삭제
	@Override
	public int deleteReply(int replyVO) throws Exception {
		return sql.delete("replyMapper.deleteReply", replyVO);
	}

}
