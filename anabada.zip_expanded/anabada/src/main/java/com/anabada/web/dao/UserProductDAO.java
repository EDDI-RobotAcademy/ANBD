package com.anabada.web.dao;

import java.util.List;

import com.anabada.web.vo.HeartVO;
import com.anabada.web.vo.PBoardVO;

public interface UserProductDAO {

	List<PBoardVO> myBoardList(String ID) throws Exception ;

	//ID에 해당하는 찜목록 불러오기 
	List<HeartVO> myHeartList(String ID) throws Exception;

}
