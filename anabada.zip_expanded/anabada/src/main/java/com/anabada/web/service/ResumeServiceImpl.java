package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.ResumeDAO;
import com.anabada.web.vo.ResumeVO;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Inject
	ResumeDAO dao;
	
	// 알바 지원 등록
	@Override
	public void resume_insert(ResumeVO vo) throws Exception{
		dao.resume_insert(vo);
	}

	// 해당 게시물에 대한 알바 지원자들 목록
	@Override
	public List<ResumeVO> resume_list(Map map) throws Exception {
		return dao.resume_list(map);
	}

	// 알바 지원글 수
	@Override
	public int resume_listCount(int j_bno) throws Exception{
		return dao.resume_listCount(j_bno);
	}
	
	//이미 알바 지원했는지 체크
	@Override
	public int resume_chk(Map map) throws Exception {
		return dao.resume_chk(map);
	}


}
