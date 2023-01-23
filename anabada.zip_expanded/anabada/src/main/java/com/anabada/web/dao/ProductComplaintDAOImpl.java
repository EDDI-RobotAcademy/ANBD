package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.ComplaintVO;

@Repository
public class ProductComplaintDAOImpl  implements ProductComplaintDAO{
	@Inject
	private SqlSession sql;

	// id에 해당하는 사람이 이미 신고한 적 있는지 체크 
	@Override
	public int validation(ComplaintVO vo) throws Exception {
		return sql.selectOne("ProductComplaintMapper.validation",vo);
	}

	//신고하기
	@Override
	public void insert(ComplaintVO vo) throws Exception {
		sql.insert("ProductComplaintMapper.insert",vo);

	}

	// PBoard에 해당하는 신고 내역 불러오기
	@Override
	public List<ComplaintVO> productList(String pboard) throws Exception {
		return sql.selectList("ProductComplaintMapper.productList",pboard);
	}

}
