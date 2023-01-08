package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.ResumeVO;

@Repository
public class ResumeDAOImpl implements ResumeDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 알바 지원 등록
	@Override
	public void resume_insert(ResumeVO vo) throws Exception {
		sqlSession.insert("resumeMapper.insert", vo);
	}

	// 해당 게시물에 대한 알바 지원자들 목록
	@Override
	public List<ResumeVO> resume_list(Map map) throws Exception {
		return sqlSession.selectList("resumeMapper.listPage", map);
	}

	// 알바지원서 총 숫자
	@Override
	public int resume_listCount(int j_bno) throws Exception {
		return sqlSession.selectOne("resumeMapper.listCount", j_bno);
	}

	// 알마 이미 지원했는지 체크
	@Override
	public int resume_chk(Map map) throws Exception {
		return sqlSession.selectOne("resumeMapper.chk", map);
	}


}
