package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.UserProductDAO;
import com.anabada.web.vo.HeartVO;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.StoreCriteria;
@Service
public class UserProductServiceImpl implements UserProductService {

	@Inject
	UserProductDAO dao;
	//자기가 쓴 게시물 목록 불러오기 
	@Override
	public List<PBoardVO> myBoardList(StoreCriteria scri) throws Exception {
		
		return dao.myBoardList(scri);
	}
	//ID에 해당하는 찜목록 불러오기 
	@Override
	public List<HeartVO> myHeartList(StoreCriteria scri) throws Exception {
		
		return dao.myHeartList(scri);
	}
	@Override
	public int storeCount(StoreCriteria scri) throws Exception {
		
		return dao.storeCount(scri);
	}
	// id에 해당하는 사람의 총 찜 갯수 리턴 
	@Override
	public int totalHeart(StoreCriteria scri) throws Exception {
		return dao.totalHeart(scri);
	}
	// 내상점 > 게시글 삭제 
	@Override
	public void deleteProductList(int[] delete_array) throws Exception {
		dao.deleteProductList(delete_array);
		
	}
	// 내 찜목록 삭제 
	@Override
	public void deleteHeartList(int[] delete_array) throws Exception {
           dao.deleteHeartList(delete_array);		
	}

}
