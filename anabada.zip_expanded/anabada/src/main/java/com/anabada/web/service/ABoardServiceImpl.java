package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.ABoardDAO;
import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.ALikeVO;
import com.anabada.web.vo.ASearchCriteria;
import com.anabada.web.vo.ComplaintVO;

@Service
public class ABoardServiceImpl implements ABoardService {
	
	@Inject
	ABoardDAO dao;

	//게시글 작성
	@Override
	public void write(ABoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}
	
	//전체 게시글 목록
	@Override
	public List<ABoardVO> list(ASearchCriteria scri) throws Exception {
		return dao.list(scri);
	}

	//전체 게시글 총 개수
	@Override
	public int listCount(ASearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}
	
	//게시글 상세보기
	@Override
	public ABoardVO read(int a_bno) throws Exception {
		dao.cnt(a_bno);
		return dao.read(a_bno);
	}
	
	//게시글 수정
	@Override
	public void update(ABoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}
	
	//게시글 삭제, 관리자가 신고한 게시글 삭제
	@Override
	public void delete(int a_bno) throws Exception {
		dao.delete(a_bno);
	}
	
	//내가 작성한 글 목록 보기
	@Override
	public List<ABoardVO> myWriteList(ASearchCriteria scri) throws Exception {
		return dao.writeList(scri);
	}
	
	//내가 작성한 글 개수
	@Override
	public int writeListCount(ASearchCriteria scri) throws Exception {
		return dao.writeListCount(scri);
	}

	//게시글 신고 DB 저장
	@Override
	public void reportComplaint(ComplaintVO complaintVO) throws Exception {
		dao.reportComplaint(complaintVO);
	}

	//게시글 신고 내역 상세보기
	@Override
	public ABoardVO complaintRead(int a_bno) throws Exception {
		return dao.complaintRead(a_bno);
	}

	@Override
	public int deleteChk(int a_bno) throws Exception {
		return dao.deleteChk(a_bno);
	}


}
