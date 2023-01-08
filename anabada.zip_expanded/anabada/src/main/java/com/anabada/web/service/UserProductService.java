package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import com.anabada.web.dao.UserProductDAO;
import com.anabada.web.vo.PBoardVO;

public interface UserProductService {


	//자기가 쓴 게시물 목록 불러오기 
	List<PBoardVO> myBoardList(String ID) throws Exception ;

}
