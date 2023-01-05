package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.JobCriteria;
import com.anabada.web.vo.JobSearchCriteria;
import com.anabada.web.vo.JobVO;

public interface JobDAO {

	public void write_boss(JobVO vo) throws Exception;

	public List<JobVO> job_list(JobSearchCriteria scri) throws Exception;

	public int job_listCount(JobSearchCriteria scri) throws Exception;

	public JobVO job_view(int j_bno) throws Exception;

	public void update_boss(JobVO vo) throws Exception;
	
	public void delete_boss(int j_bno) throws Exception;

	public List<JobVO> my_jobList(Map map) throws Exception;

	public int my_jobListCount(JobCriteria cri) throws Exception;

	public int heartCheck(Map<String, String> check) throws Exception;

	public void addHeart(Map<String, String> param) throws Exception;

	public void upHeart(int j_bno) throws Exception;

	public void subHeart(Map<String, String> param) throws Exception;

	public void downHeart(int j_bno) throws Exception;
	
}
