package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.PutInVO;

@Repository
public class PutInDAOImpl implements PutInDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 알바 지원 등록
	@Override
	public void putIn_job(PutInVO vo) throws Exception {
		sqlSession.insert("putInMapper.insert", vo);
	}

	// 해당 게시물에 대한 알바 지원자들 목록
	@Override
	public List<PutInVO> putIn_list(Map map) throws Exception {
		return sqlSession.selectList("putInMapper.listPage", map);
	}

	// 알바지원서 총 숫자
	@Override
	public int putIn_listCount() throws Exception {
		return sqlSession.selectOne("putInMapper.listCount");
	}

	// 해당 알바 구인 게시물 제목
	@Override
	public String job_title(int j_bno) throws Exception {
		return sqlSession.selectOne("putInMapper.j_title", j_bno);
	}

}
