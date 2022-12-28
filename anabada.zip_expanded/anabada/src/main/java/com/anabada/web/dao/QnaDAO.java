package com.anabada.web.dao;

import java.util.List;

import com.anabada.web.vo.QnaVO;
import com.anabada.web.vo.SearchCriteria;

public interface QnaDAO {

	// 게시글 작성
	public void write(QnaVO qnaVO) throws Exception;
		
	// 게시글 목록
	public List<QnaVO> list(SearchCriteria scri) throws Exception;
		
	// 게시글 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
		
	// 게시물 조회
	public QnaVO read(int q_no) throws Exception;
			
	// 게시물 수정
	public void update(QnaVO qnaVO) throws Exception;
		
	// 게시물 삭제
	public void delete(int q_no) throws Exception;
	
}
