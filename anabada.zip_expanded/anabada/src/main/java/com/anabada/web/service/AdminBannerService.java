package com.anabada.web.service;

public interface AdminBannerService {

	void fileSave(String filePath) throws Exception;

	String imgPath(int a_no) throws Exception;

	void deleteImg(int a_no) throws Exception;

}
