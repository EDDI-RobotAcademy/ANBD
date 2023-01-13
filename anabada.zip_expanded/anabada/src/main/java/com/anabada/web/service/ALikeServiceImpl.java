package com.anabada.web.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.ALikeDAO;
import com.anabada.web.vo.ALikeVO;

@Service
public class ALikeServiceImpl implements ALikeService {
	
	@Inject
	ALikeDAO likeDAO;
	
	//좋아요 눌렀는지 확인
	@Override
	public int likeCheck(Map<String, String> likeChk) throws Exception {
		return likeDAO.likeCheck(likeChk);
	}
	
	//좋아요 추가
	@Override
	public void insertLike(Map<String, String> bnoId) throws Exception {
		likeDAO.insertLike(bnoId);
	}

	//좋아요 취소
	@Override
	public void deleteLike(Map<String, String> bnoId) throws Exception {
		likeDAO.deleteLike(bnoId);
	}

	//각각 다른 아이디가 좋아요 눌렀을 때 +1
	@Override
	public int updateLike(int a_bno) throws Exception {
		return likeDAO.updateLike(a_bno);
		
	}
	
	//각각 다른 아이디가 좋아요 취소했을 때 -1
	@Override
	public void deleteIsLike(int a_bno) throws Exception {
		likeDAO.deleteIsLike(a_bno);
	}

}
