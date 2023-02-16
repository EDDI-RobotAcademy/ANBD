package com.anabada.web.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminBannerDAOImpl implements AdminBannerDAO {

	@Inject
	private SqlSession sql;
	
	@Override
	public void fileSave(String filePath) throws Exception {
		sql.insert("adminBannerMapper.fileSave", filePath);
	}

}
