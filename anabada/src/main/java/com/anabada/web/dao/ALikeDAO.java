package com.anabada.web.dao;

import java.util.Map;

import com.anabada.web.vo.ALikeVO;

public interface ALikeDAO {
 
	public int likeCheck(Map<String, String> likeChk) throws Exception;

	public void insertLike(Map<String, String> bnoId) throws Exception;

	public void deleteLike(Map<String, String> bnoId) throws Exception;


}
