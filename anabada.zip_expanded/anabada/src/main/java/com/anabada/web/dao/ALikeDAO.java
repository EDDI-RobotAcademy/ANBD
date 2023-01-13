package com.anabada.web.dao;

import java.util.Map;

import com.anabada.web.vo.ALikeVO;

public interface ALikeDAO {

	//좋아요 눌렀는지 확인
	public int likeCheck(Map<String, String> likeChk) throws Exception;

	//좋아요 추가
	public void insertLike(Map<String, String> bnoId) throws Exception;

	//좋아요 취소
	public void deleteLike(Map<String, String> bnoId) throws Exception;

	//각각 다른 아이디가 좋아요 눌렀을 때 +1
	public int updateLike(int a_bno) throws Exception;

	//각각 다른 아이디가 좋아요 취소 했을 때 -1
	public void deleteIsLike(int a_bno) throws Exception;

}
