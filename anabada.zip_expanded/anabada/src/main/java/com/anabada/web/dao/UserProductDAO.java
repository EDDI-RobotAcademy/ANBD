package com.anabada.web.dao;

import java.util.List;

import com.anabada.web.vo.PBoardVO;

public interface UserProductDAO {

	List<PBoardVO> myBoardList(String id) throws Exception ;

}
