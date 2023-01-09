package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.ALikeVO;
import com.anabada.web.vo.ASearchCriteria;

public interface ABoardService {

	public void write(ABoardVO boardVO) throws Exception;
	
	public List<ABoardVO> list(ASearchCriteria scri) throws Exception;
	
	public int listCount(ASearchCriteria scri) throws Exception;
	
	public ABoardVO read(int a_bno) throws Exception;
	
	public void update(ABoardVO boardVO) throws Exception;
	
	public void delete(int a_bno) throws Exception;

}
