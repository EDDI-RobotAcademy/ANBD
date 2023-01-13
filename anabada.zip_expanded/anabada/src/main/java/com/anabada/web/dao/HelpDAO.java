package com.anabada.web.dao;

import java.util.List;

import com.anabada.web.vo.HelpVO;
import com.anabada.web.vo.SearchCriteria;

public interface HelpDAO {

	// 게시글 작성
	public void write(HelpVO helpVO) throws Exception;
	
	// 게시글 목록
	public List<HelpVO> list(SearchCriteria scri) throws Exception;
	
	// 게시글 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public HelpVO read(int h_no) throws Exception;
		
	// 게시물 수정
	public void update(HelpVO helpVO) throws Exception;
		
	// 게시물 삭제
	public void delete(int h_no) throws Exception;
}
