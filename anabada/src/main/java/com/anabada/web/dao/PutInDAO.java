package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.PutInVO;

public interface PutInDAO {

	public void putIn_job(PutInVO vo) throws Exception;

	public List<PutInVO> putIn_list(Map map) throws Exception;
	
	public int putIn_listCount() throws Exception;

	public String job_title(int j_bno) throws Exception;
	
}
