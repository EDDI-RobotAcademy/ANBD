package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.QnaReplyVO;

@Repository
public class QnaReplyDAOImpl implements QnaReplyDAO {

	@Inject
	SqlSession sql;
	
	//댓글 조회
	@Override
	public List<QnaReplyVO> readReply(int q_no) throws Exception {
		return sql.selectList("qnareplyMapper.readReply", q_no);
	}

	//댓글 작성
	@Override
	public void writeReply(QnaReplyVO vo) throws Exception {
		sql.insert("qnareplyMapper.writeReply", vo);
	}

	//댓글 수정
	@Override
	public void updateReply(QnaReplyVO vo) throws Exception {
		sql.update("qnareplyMapper.updateReply", vo);
	}

	//댓글 삭제
	@Override
	public void deleteReply(QnaReplyVO vo) throws Exception {
		sql.delete("qnareplyMapper.deleteReply", vo);
	}

	//선택된 댓글 조회
	@Override
	public QnaReplyVO selectReply(int qr_no) throws Exception {
		return sql.selectOne("qnareplyMapper.selectReply", qr_no);
	}
	
}
