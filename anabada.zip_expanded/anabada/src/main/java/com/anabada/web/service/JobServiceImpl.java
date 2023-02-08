package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.JobDAO;
import com.anabada.web.vo.ComplaintVO;
import com.anabada.web.vo.JheartVO;
import com.anabada.web.vo.JobCriteria;
import com.anabada.web.vo.JobSearchCriteria;
import com.anabada.web.vo.JobVO;

@Service
public class JobServiceImpl implements JobService {

	@Inject
	JobDAO dao;
	
	// 알바 구인 게시글 작성
	@Override
	public void job_insert(JobVO vo) throws Exception {
		dao.job_insert(vo);
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
	public JobVO job_read(int j_bno) throws Exception {
		return dao.job_read(j_bno);
	}

	// 알바 구인 게시물 수정 
	@Override
	public void job_update(JobVO vo) throws Exception {
		dao.job_update(vo);
	}

	// 삭제
	@Override
	public void job_delete(int j_bno) throws Exception {
		dao.job_delete(j_bno);
	}

	// 찜했는지 안했는지 조회
	@Override
	public int job_heartCheck(Map<String, String> check) throws Exception {
		return dao.job_heartCheck(check);
	}

	// 하트 찜하기
	@Override
	public void job_addHeart(Map<String, String> param) throws Exception{
		dao.job_addHeart(param);
	}

	// 하트 찜 개수 늘리기 +1
	@Override
	public void job_upHeart(int j_bno) throws Exception {
		dao.job_upHeart(j_bno);
	}

	// 하트 찜 해제
	@Override
	public void job_subHeart(Map<String, String> param) throws Exception{
		dao.job_subHeart(param);
	}

	// 하트 찜 개수 줄이기 -1
	@Override
	public void job_downHeart(int j_bno) throws Exception {
		dao.job_downHeart(j_bno);
	}

	
	////////////알바 마이페이지
	// 내가 쓴글들 다 보기
	@Override
	public List<JobVO> my_jobList(Map map) throws Exception {
		return dao.my_jobList(map);
	}

	// 사장이 쓴 알바게시물 갯수
	@Override
	public int my_jobListCount(String id) throws Exception {
		return dao.my_jobListCount(id);
	}
	
	// 알바 마이페이지에서 게시글들 삭제
	@Override
	public void my_jobDelete(int[] delete_array) throws Exception {
		dao.my_jobDelete(delete_array);
	}

	// 알바 찜 목록 불러오기
	@Override
	public List<JheartVO> heart_jobList(Map<String, Object> map) throws Exception {
		return dao.heart_jobLIst(map);
	}

	// 알바찜 개수
	@Override
	public int heart_jobListCount(String id) throws Exception {
		return dao.heart_jobLisCount(id);
	}

	// 알바 찜 삭제
	@Override
	public void heart_delete(Map map) throws Exception {
		dao.heart_delete(map);
	}

	// 알바 신고 등록
	@Override
	public void report_insert(ComplaintVO vo) throws Exception {
		dao.report_insert(vo);
	}

	// 알바 신고 내역 체크
	@Override
	public int report_chk(ComplaintVO vo) throws Exception {
		return dao.report_chk(vo);
	}

	// 마이페이지에서 삭제할 때 신고내역이 있다면 삭제하는 메소드
	@Override
	public void delete_complaint(int[] delete_array) throws Exception {
		dao.delete_complaint(delete_array);
	}

	


}
