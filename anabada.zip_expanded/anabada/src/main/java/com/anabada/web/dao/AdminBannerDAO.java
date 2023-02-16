package com.anabada.web.dao;

public interface AdminBannerDAO {

	void fileSave(String filePath) throws Exception;

	String imgPath(int a_no) throws Exception;

	void deleteImg(int a_no) throws Exception;

}
