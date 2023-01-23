package com.anabada.web.service;

import java.util.List;

import com.anabada.web.vo.ComplaintVO;

public interface ProductComplaintService {

	// id에 해당하는 사람이 이미 신고한 적 있는지 체크 
	int validation(ComplaintVO vo) throws Exception ;

	//신고하기
	void insert(ComplaintVO vo) throws Exception;

	// PBoard에 해당하는 신고 내역 불러오기 
	List<ComplaintVO> productList(String pboard)throws Exception;

}
