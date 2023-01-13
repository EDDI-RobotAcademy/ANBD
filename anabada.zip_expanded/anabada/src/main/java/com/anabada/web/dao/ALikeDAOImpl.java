package com.anabada.web.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.ALikeVO;

@Repository
public class ALikeDAOImpl implements ALikeDAO {

	@Inject
	private SqlSession sqlSession;
	
	//좋아요 눌렀는지 확인
	@Override
	public int likeCheck(Map<String, String> likeChk) throws Exception {
		return sqlSession.selectOne("likeMapper.likeCheck", likeChk);
	}

	//좋아요 추가
	@Override
	public void insertLike(Map<String, String> bnoId) throws Exception {
		sqlSession.insert("likeMapper.insertLike", bnoId);
	}

	//좋아요 취소
	@Override
	public void deleteLike(Map<String, String> bnoId) throws Exception {
		sqlSession.delete("likeMapper.deleteLike", bnoId);
	}

	//각각 다른 아이디가 좋아요 눌렀을 때 +1
	@Override
	public int updateLike(int a_bno) throws Exception {
		return sqlSession.update("likeMapper.updateLike", a_bno);
	}

	//각각 다른 아이디가 좋아요 취소 했을 때 -1
	@Override
	public void deleteIsLike(int a_bno) throws Exception {
		sqlSession.update("likeMapper.deleteIsLike", a_bno);
	}



}
