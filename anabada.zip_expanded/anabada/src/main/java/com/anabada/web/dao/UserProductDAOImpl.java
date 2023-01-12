package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.HeartVO;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.StoreCriteria;

@Repository
public class UserProductDAOImpl implements UserProductDAO{

	@Inject
	private SqlSession sql;
	//자기가 쓴 게시물 목록 불러오기 
	@Override
	public List<PBoardVO> myBoardList(StoreCriteria scri) throws Exception {
		
		return sql.selectList("pBoardMapper.myBoardList",scri);
	}
	//ID에 해당하는 찜목록 불러오기 
	@Override
	public List<HeartVO> myHeartList(StoreCriteria scri) throws Exception {
		return sql.selectList("HeartMapper.myHeartList",scri);
	}
	@Override
	public int storeCount(StoreCriteria scri) throws Exception {
		return sql.selectOne("pBoardMapper.storeCount",scri);
	}
	// id에 해당하는 사람의 총 찜 갯수 리턴 
	@Override
	public int totalHeart(StoreCriteria scri) throws Exception {
		return sql.selectOne("HeartMapper.totalHeart",scri);
	}
	// 내상점 > 게시글 삭제 
	@Override
	public void deleteProductList(int[] delete_array) throws Exception {
            sql.delete("pBoardMapper.deleteProductList",delete_array);		 // pboard에서 게시글 삭제 
	}
	// 내 찜목록 삭제 
	@Override
	public void deleteHeartList(int[] delete_array) throws Exception {
           sql.delete("HeartMapper.deleteHeartList",delete_array);		
	}

}
