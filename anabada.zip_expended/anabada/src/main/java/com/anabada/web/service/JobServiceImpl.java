package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.JobDAO;
import com.anabada.web.vo.JobCriteria;
import com.anabada.web.vo.JobSearchCriteria;
import com.anabada.web.vo.JobVO;

@Service
public class JobServiceImpl implements JobService {

	@Inject
	JobDAO dao;
	
	// 알바 구인 게시글 작성
	@Override
	public void write_boss(JobVO vo) throws Exception {
		dao.write_boss(vo);
	}

	// 알바 목록 조회
	@Override
	public List<JobVO> job_list(JobSearchCriteria scri) throws Exception {
		return dao.job_list(scri);
	}

	// 게시글 총 개수
	@Override
	public int job_listCount(JobSearchCriteria scri) throws Exception {
		return dao.job_listCount(scri);
	}

	// 알바 구인 게시물 상세 보기
	@Override
	public JobVO job_view(int j_bno) throws Exception {
		return dao.job_view(j_bno);
	}

	// 알바 구인 게시물 수정 
	@Override
	public void update_boss(JobVO vo) throws Exception {
		dao.update_boss(vo);
	}

	// 삭제
	@Override
	public void delete_boss(int j_bno) throws Exception {
		dao.delete_boss(j_bno);
	}

	// 내가 쓴글들 다 보기
	@Override
	public List<JobVO> my_jobList(Map map) throws Exception {
		return dao.my_jobList(map);
	}

	// 사장이 쓴 알바게시물 갯수
	@Override
	public int my_jobListCount(JobCriteria cri) throws Exception {
		return dao.my_jobListCount(cri);
	}

	// 찜했는지 안했는지 조회
	@Override
	public int heartCheck(Map<String, String> check) throws Exception {
		return dao.heartCheck(check);
	}

	// 하트 찜하기
	@Override
	public void addHeart(Map<String, String> param) throws Exception{
		dao.addHeart(param);
	}

	// 하트 찜 개수 늘리기 +1
	@Override
	public void upHeart(int j_bno) throws Exception {
		dao.upHeart(j_bno);
	}

	// 하트 찜 해제
	@Override
	public void subHeart(Map<String, String> param) throws Exception{
		dao.subHeart(param);
	}

	// 하트 찜 개수 줄이기 -1
	@Override
	public void downHeart(int j_bno) throws Exception {
		dao.downHeart(j_bno);
	}
	

}
