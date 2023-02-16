package com.anabada.web.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.AdminBannerDAO;

@Service
public class AdminBannerServiceImpl implements AdminBannerService {

	@Inject
	AdminBannerDAO dao;

	// 배너 이미지 추가
	@Override
	public void fileSave(String filePath) throws Exception {
		dao.fileSave(filePath);
	}

	// 삭제할 배너 이미지 경로 가져오기
	@Override
	public String imgPath(int a_no) throws Exception {
		return dao.imgPath(a_no);
	}

	// 배너 이미지 삭제
	@Override
	public void deleteImg(int a_no) throws Exception {
		dao.deleteImg(a_no);
	}

}
