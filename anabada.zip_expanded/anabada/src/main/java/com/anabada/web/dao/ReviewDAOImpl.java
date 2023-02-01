package com.anabada.web.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Inject
	private SqlSession sqlSession;

	// 후기 남기기
	@Override
	public void review_register(ReviewVO reviewVO) throws Exception {
		sqlSession.insert("reviewMapper.register", reviewVO);
	}

	// 후기 이미 남겼는지 체크
	@Override
	public int review_chk(int pno) throws Exception {
		return sqlSession.selectOne("reviewMapper.count", pno);
	}

	// lev 점수 업데이트 
	@Override
	public void updateLev(ReviewVO reviewVO) throws Exception {
		sqlSession.update("reviewMapper.updateLev",reviewVO);
		
	}

	//r_no에 해당하는 리뷰 반환 
	@Override
	public ReviewVO read(int r_no) throws Exception {
		return sqlSession.selectOne("reviewMapper.read",r_no);
	}

}
