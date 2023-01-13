package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.ResumeDAO;
import com.anabada.web.vo.JobVO;
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

	//마이페이지에서 내가 지원할 알바 목록
	@Override
	public List<ResumeVO> my_resumeList(Map map) throws Exception {
		return dao.my_resumeList(map);
	}

	//마이페이지 내가 지원한 알바 개수
	@Override
	public int my_resumeListCount(String id) throws Exception {
		return dao.my_resumeListCount(id);
	}

	//내가 지원한 알바 볼때 어떤 게시물에 대한 알바지원서인지
	@Override
	public List<JobVO> my_resumeJob(int[] jbno_array) throws Exception {
		return dao.my_resumeJob(jbno_array);
	}

	//내 알바 지원 삭제에서 삭제
	@Override
	public void my_resumeDelete(int[] delete_array) throws Exception {
		dao.my_resumeDelete(delete_array);
	}

	// 내 지원 상세보기(수정할때)
	@Override
	public ResumeVO resume_read(int r_bno) throws Exception {
		return dao.resume_read(r_bno);
	}

	// 지원서 수정
	@Override
	public void resume_update(ResumeVO vo) throws Exception {
		dao.resume_update(vo);
	}
	
	


}
