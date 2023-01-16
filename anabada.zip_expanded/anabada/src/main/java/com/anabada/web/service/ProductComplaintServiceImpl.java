package com.anabada.web.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.ProductComplaintDAO;
import com.anabada.web.vo.ComplaintVO;



@Service
public class ProductComplaintServiceImpl implements ProductComplaintService {

	@Inject
	ProductComplaintDAO dao;

	// id에 해당하는 사람이 이미 신고한 적 있는지 체크 
	@Override
	public int validation(ComplaintVO vo) throws Exception {
		
		return dao.validation(vo);
	}

	//신고하기
	@Override
	public void insert(ComplaintVO vo) throws Exception {
		dao.insert(vo);
		
	}
	
	
	
}
