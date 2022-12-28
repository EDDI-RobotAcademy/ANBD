package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.HelpDAO;
import com.anabada.web.vo.HelpVO;
import com.anabada.web.vo.SearchCriteria;

@Service
public class HelpServiceImpl implements HelpService {

	@Inject
	private HelpDAO dao;
	
	// 게시글 작성
	@Override
	public void write(HelpVO helpVO) throws Exception {
		dao.write(helpVO);
	}

	// 게시글 목록 조회
	@Override
	public List<HelpVO> list(SearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	// 게시글 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	// 게시글 조회
	@Override
	public HelpVO read(int h_no) throws Exception {
		return dao.read(h_no);
	}

	// 게시글 수정
	@Override
	public void update(HelpVO helpVO) throws Exception {
		dao.update(helpVO);
	}

	// 게시글 삭제
	@Override
	public void delete(int h_no) throws Exception {
		dao.delete(h_no);
	}
	
}
