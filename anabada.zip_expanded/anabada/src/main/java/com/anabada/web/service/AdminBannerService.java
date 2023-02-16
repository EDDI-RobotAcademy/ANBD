package com.anabada.web.service;

import java.util.List;

import com.anabada.web.vo.BannerVO;
import com.anabada.web.vo.SearchCriteria;

public interface AdminBannerService {

	public void fileSave(String filePath) throws Exception;
	
	public List<BannerVO> list(SearchCriteria scri) throws Exception;

	public String imgPath(int a_no) throws Exception;

	public void deleteImg(int a_no) throws Exception;

}
