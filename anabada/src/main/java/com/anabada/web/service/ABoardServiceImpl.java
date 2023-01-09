package com.anabada.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.ABoardDAO;
import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.ALikeVO;
import com.anabada.web.vo.ASearchCriteria;

@Service
public class ABoardServiceImpl implements ABoardService {
	
	@Inject
	ABoardDAO dao;

	@Override
	public void write(ABoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}

	@Override
	public List<ABoardVO> list(ASearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	@Override
	public int listCount(ASearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

	@Override
	public ABoardVO read(int a_bno) throws Exception {
		dao.cnt(a_bno);
		return dao.read(a_bno);
	}

	@Override
	public void update(ABoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}

	@Override
	public void delete(int a_bno) throws Exception {
		dao.delete(a_bno);
	}
}
