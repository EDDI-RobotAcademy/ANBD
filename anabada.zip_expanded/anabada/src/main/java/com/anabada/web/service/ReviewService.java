package com.anabada.web.service;

import com.anabada.web.vo.ReviewVO;

public interface ReviewService {

	void review_register(ReviewVO reviewVO) throws Exception;

	int review_chk(int pno) throws Exception;

}
