package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import com.anabada.web.dao.UserProductDAO;
import com.anabada.web.vo.HeartVO;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.StoreCriteria;

public interface UserProductService {


	//자기가 쓴 게시물 목록 불러오기 
	List<PBoardVO> myBoardList(StoreCriteria scri) throws Exception ;

	//ID에 해당하는 찜 목록 불러오기 
	List<HeartVO> myHeartList(StoreCriteria scri) throws Exception;

	int storeCount(StoreCriteria scri) throws Exception ;

	// id에 해당하는 사람의 총 찜 갯수 리턴 
	int totalHeart(StoreCriteria scri) throws Exception;

	// 내상점 > 게시글 삭제 
	void deleteProductList(int[] delete_array) throws Exception;

}
