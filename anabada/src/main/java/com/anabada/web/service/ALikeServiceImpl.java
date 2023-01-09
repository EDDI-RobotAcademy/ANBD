package com.anabada.web.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.ALikeDAO;
import com.anabada.web.vo.ALikeVO;

@Service
public class ALikeServiceImpl implements ALikeService {
	
	@Inject
	ALikeDAO likeDAO;
	
	@Override
	public int likeCheck(Map<String, String> likeChk) throws Exception {
		return likeDAO.likeCheck(likeChk);
	}
	
	@Override
	public void insertLike(Map<String, String> bnoId) throws Exception {
		likeDAO.insertLike(bnoId);
	}

	@Override
	public void deleteLike(Map<String, String> bnoId) throws Exception {
		likeDAO.deleteLike(bnoId);
	}

//	@Override
//	public int insertLike(ALikeVO likeVO) throws Exception {
//		
//		int result = 0;
//		
//		ALikeVO find = likeDAO.likeCheck(likeVO);
//		
//		if(find == null) {
//			result = likeDAO.insertLike(likeVO);
//		}
//		else {
//			likeDAO.deleteLike(likeVO);
//		}
//		
//		return result;
//	}

}
