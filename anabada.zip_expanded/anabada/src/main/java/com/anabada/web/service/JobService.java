package com.anabada.web.service;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.anabada.web.vo.ComplaintVO;
import com.anabada.web.vo.JheartVO;
import com.anabada.web.vo.JobCriteria;
import com.anabada.web.vo.JobSearchCriteria;
import com.anabada.web.vo.JobVO;

public interface JobService {

	public void job_insert(JobVO vo) throws Exception;

	public List<JobVO> job_list(JobSearchCriteria scri) throws Exception;

	public int job_listCount(JobSearchCriteria scri) throws Exception;

	public JobVO job_read(int j_bno) throws Exception;

	public void job_update(JobVO vo) throws Exception;

	public void job_delete(int j_bno) throws Exception;

	public int job_heartCheck(Map<String, String> check) throws Exception;

	public void job_addHeart(Map<String, String> param) throws Exception;

	public void job_upHeart(int j_bno) throws Exception;

	public void job_subHeart(Map<String, String> param) throws Exception;

	public void job_downHeart(int j_bno) throws Exception;

	//알바마이페지 관련 
	public List<JobVO> my_jobList(Map map) throws Exception;

	public int my_jobListCount(String id) throws Exception;
	
	public void my_jobDelete(int[] delete_array) throws Exception;

	
	// 알바 찜 관련
	public List<JheartVO> heart_jobList(Map<String, Object> map) throws Exception;

	public int heart_jobListCount(String id) throws Exception;

	public void heart_delete(Map<String, Object> map) throws Exception;

	// 알바 신고 관련
	public void report_insert(ComplaintVO vo) throws Exception;

	public int report_chk(ComplaintVO vo) throws Exception;

	// 마이페이지에서 게시물 삭제할때 신고내역도 있으면 삭제하는거
	public void delete_complaint(int[] delete_array) throws Exception;

	
	// 최근 본 알바 게시물 삭제돼었는지 체크
	public List recent_chk(int[] recent_array) throws Exception;

	// 상세보기 유효성 삭제 체크
	public int read_chk(int j_bno) throws Exception;

	
	// 회원 탈퇴할 때 이미지도 컴퓨터에서 삭제하기 위해 
	public List img_list(String id) throws Exception;



	
	
	

}
