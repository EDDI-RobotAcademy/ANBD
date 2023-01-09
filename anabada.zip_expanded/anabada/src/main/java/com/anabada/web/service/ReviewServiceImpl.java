package com.anabada.web.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.ReviewDAO;
import com.anabada.web.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	ReviewDAO dao;
	
	// 후기 남기기
	@Override
	public void review_register(ReviewVO reviewVO) throws Exception {
		dao.review_register(reviewVO);
	}

	// 이미 저장되어 있는지 체크
	@Override
	public int review_chk(int pno) throws Exception {
		return dao.review_chk(pno);
	}

	// lev 점수 업데이트 
	@Override
	public void updateLev(ReviewVO reviewVO) throws Exception {
		dao.updateLev(reviewVO);
	}

}
