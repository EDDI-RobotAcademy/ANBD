package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.BannerVO;
import com.anabada.web.vo.SearchCriteria;

@Repository
public class AdminBannerDAOImpl implements AdminBannerDAO {

	@Inject
	private SqlSession sql;
	
	// 배너 이미지 등록
	@Override
	public void fileSave(String filePath) throws Exception {
		sql.insert("adminBannerMapper.fileSave", filePath);
	}
	
	// 배너 리스트
	@Override
	public List<BannerVO> list(SearchCriteria scri) throws Exception {
		return sql.selectList("adminBannerMapper.imgList", scri);
	}

	// 삭제할때 배너 이미지 경로 가져오기
	@Override
	public String imgPath(int a_no) throws Exception {
		return sql.selectOne("adminBannerMapper.imgPath", a_no);
	}

	// 배너 이미지 삭제
	@Override
	public void deleteImg(int a_no) throws Exception {
		sql.delete("adminBannerMapper.delete", a_no);
	}

}
