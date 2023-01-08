package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.UserProductDAO;
import com.anabada.web.vo.PBoardVO;
@Service
public class UserProductServiceImpl implements UserProductService {

	@Inject
	UserProductDAO dao;
	//자기가 쓴 게시물 목록 불러오기 
	@Override
	public List<PBoardVO> myBoardList(String ID) throws Exception {
		
		return dao.myBoardList(ID);
	}

}
