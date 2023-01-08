package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.HeartVO;
import com.anabada.web.vo.PBoardVO;

@Repository
public class UserProductDAOImpl implements UserProductDAO{

	@Inject
	private SqlSession sql;
	//자기가 쓴 게시물 목록 불러오기 
	@Override
	public List<PBoardVO> myBoardList(String ID) throws Exception {
		
		return sql.selectList("pBoardMapper.myBoardList",ID);
	}
	//ID에 해당하는 찜목록 불러오기 
	@Override
	public List<HeartVO> myHeartList(String ID) throws Exception {
		return sql.selectList("HeartMapper.myHeartList",ID);
	}

}
