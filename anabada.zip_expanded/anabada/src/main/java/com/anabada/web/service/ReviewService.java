package com.anabada.web.service;

import com.anabada.web.vo.ReviewVO;

public interface ReviewService {

	void review_register(ReviewVO reviewVO) throws Exception;

	int review_chk(int pno) throws Exception;

	// lev 점수 업데이트 
	void updateLev(ReviewVO reviewVO) throws Exception;

	//r_no에 해당하는 리뷰 반환 
	ReviewVO read(int r_no) throws Exception;

}
