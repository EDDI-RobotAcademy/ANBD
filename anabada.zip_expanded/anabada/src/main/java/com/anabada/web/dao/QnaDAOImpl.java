package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.QnaVO;
import com.anabada.web.vo.SearchCriteria;

@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(QnaVO qnaVO) throws Exception {
		sqlSession.insert("qnaMapper.insert", qnaVO);
	}

	// 게시글 목록
	@Override
	public List<QnaVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("qnaMapper.listPage", scri);
	}

	// 게시물 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("qnaMapper.listCount", scri);
	}

	// 게시글 조회
	@Override
	public QnaVO read(int q_no) throws Exception {
		return sqlSession.selectOne("qnaMapper.read", q_no);
	}

	// 게시글 수정
	@Override
	public void update(QnaVO qnaVO) throws Exception {
		sqlSession.update("qnaMapper.update", qnaVO);
	}

	// 게시글 삭제
	@Override
	public void delete(int q_no) throws Exception {
		sqlSession.delete("qnaMapper.delete", q_no);
	}
	
	// 댓글 수
	@Override
	public void replyCount(int q_no) throws Exception {
		sqlSession.update("qnaMapper.replyCount", q_no);
	}

}
