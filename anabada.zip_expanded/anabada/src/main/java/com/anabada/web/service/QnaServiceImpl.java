package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.QnaDAO;
import com.anabada.web.vo.QnaVO;
import com.anabada.web.vo.SearchCriteria;

@Service
public class QnaServiceImpl implements QnaService {

	@Inject
	private QnaDAO dao;
	
	// 게시글 작성
	@Override
	public void write(QnaVO qnaVO) throws Exception {
		dao.write(qnaVO);
	}

	// 게시글 목록 조회
	@Override
	public List<QnaVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	// 게시글 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	// 게시글 조회
	@Override
	public QnaVO read(int q_no) throws Exception {
		return dao.read(q_no);
	}

	// 게시글 수정
	@Override
	public void update(QnaVO qnaVO) throws Exception {
		dao.update(qnaVO);
	}

	// 게시글 삭제
	@Override
	public void delete(int q_no) throws Exception {
		dao.delete(q_no);
	}

	// 댓글 수
	@Override
	public void replyCount(int q_no) throws Exception {
		dao.replyCount(q_no);
	}



}
