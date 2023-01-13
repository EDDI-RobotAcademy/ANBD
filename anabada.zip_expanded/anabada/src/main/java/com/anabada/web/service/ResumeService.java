package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.JobVO;
import com.anabada.web.vo.ResumeVO;

public interface ResumeService {

	public void resume_insert(ResumeVO vo) throws Exception;

	public List<ResumeVO> resume_list(Map map) throws Exception;

	public int resume_listCount(int j_bno) throws Exception;

	public int resume_chk(Map map) throws Exception;

	public List<ResumeVO> my_resumeList(Map map) throws Exception;

	public int my_resumeListCount(String id) throws Exception;

	public List<JobVO> my_resumeJob(int[] jbno_array) throws Exception;

	public void my_resumeDelete(int[] delete_array) throws Exception;

	public ResumeVO resume_read(int r_bno) throws Exception;

	public void resume_update(ResumeVO vo) throws Exception;

}
