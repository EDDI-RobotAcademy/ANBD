package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.ResumeVO;

public interface ResumeDAO {

	public void resume_insert(ResumeVO vo) throws Exception;

	public List<ResumeVO> resume_list(Map map) throws Exception;
	
	public int resume_listCount(int j_bno) throws Exception;

	public int resume_chk(Map map) throws Exception;

	
}
