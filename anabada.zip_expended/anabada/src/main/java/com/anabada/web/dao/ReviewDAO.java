package com.anabada.web.dao;

import com.anabada.web.vo.ReviewVO;

public interface ReviewDAO {

	void review_register(ReviewVO reviewVO) throws Exception;

	int review_chk(int pno) throws Exception;

}
