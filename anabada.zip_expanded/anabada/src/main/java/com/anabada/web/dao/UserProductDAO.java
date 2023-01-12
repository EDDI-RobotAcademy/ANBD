package com.anabada.web.dao;

import java.util.List;

import com.anabada.web.vo.HeartVO;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.StoreCriteria;

public interface UserProductDAO {

	List<PBoardVO> myBoardList(StoreCriteria scri) throws Exception ;

	//ID에 해당하는 찜목록 불러오기 
	List<HeartVO> myHeartList(StoreCriteria scri) throws Exception;

	int storeCount(StoreCriteria scri) throws Exception;

	// id에 해당하는 사람의 총 찜 갯수 리턴 
	int totalHeart(StoreCriteria scri) throws Exception;

	void deleteProductList(int[] delete_array) throws Exception;

	// 내 찜목록 삭제 
	void deleteHeartList(int[] delete_array) throws Exception;

}
