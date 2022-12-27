package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.PutInDAO;
import com.anabada.web.vo.PutInVO;

@Service
public class PutInServiceImpl implements PutInService {

	@Inject
	PutInDAO dao;
	
	// 알바 지원 등록
	@Override
	public void putIn_job(PutInVO vo) throws Exception{
		dao.putIn_job(vo);
	}

	// 해당 게시물에 대한 알바 지원자들 목록
	@Override
	public List<PutInVO> putIn_list(Map map) throws Exception {
		return dao.putIn_list(map);
	}

	// 알바 지원글 수
	@Override
	public int putIn_listCount() throws Exception{
		return dao.putIn_listCount();
	}

	// 해당 알바게시글 이름 가져오는 거
	@Override
	public String job_title(int j_bno) throws Exception {
		return dao.job_title(j_bno);
	}

}
