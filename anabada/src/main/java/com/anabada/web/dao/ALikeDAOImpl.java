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
	
	@Override
	public int likeCheck(Map<String, String> likeChk) throws Exception {
		return sqlSession.selectOne("likeMapper.likeCheck", likeChk);
	}

	@Override
	public void insertLike(Map<String, String> bnoId) throws Exception {
		sqlSession.insert("likeMapper.insertLike", bnoId);
	}

	@Override
	public void deleteLike(Map<String, String> bnoId) throws Exception {
		sqlSession.delete("likeMapper.deleteLike", bnoId);
	}


}
