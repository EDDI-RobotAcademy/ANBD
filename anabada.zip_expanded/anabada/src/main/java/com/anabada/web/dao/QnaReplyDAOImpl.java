package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.anabada.web.vo.QnaReplyVO;

@Service
public class QnaReplyDAOImpl implements QnaReplyDAO {

	@Inject
	SqlSession sql;
	
	@Override
	public List<QnaReplyVO> readReply(int q_no) throws Exception {
		return sql.selectList("replyMapper.readReply", q_no);
	}

	@Override
	public void writeReply(QnaReplyVO vo) throws Exception {
		sql.insert("qnareplyMapper.writeReply", vo);
	}

	@Override
	public void updateReply(QnaReplyVO vo) throws Exception {
		sql.update("qnareplyMapper.updateReply", vo);
	}

	@Override
	public void deleteReply(QnaReplyVO vo) throws Exception {
		sql.delete("qnareplyMapper.deleteReply", vo);
	}

	@Override
	public QnaReplyVO selectReply(int qr_no) throws Exception {
		return sql.selectOne("qnareplyMapper.selectReply", qr_no);
	}
	
}
