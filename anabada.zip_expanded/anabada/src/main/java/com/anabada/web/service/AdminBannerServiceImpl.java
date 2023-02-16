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

}
