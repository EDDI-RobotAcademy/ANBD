package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.JobCriteria;
import com.anabada.web.vo.JobSearchCriteria;
import com.anabada.web.vo.JobVO;

@Repository
public class JobDAOImpl implements JobDAO{

	@Inject
	private SqlSession sqlSession;
	
	// 게시물 작성
	@Override
	public void write_boss(JobVO vo) throws Exception {
		sqlSession.insert("jobMapper.insert", vo);
	}

	// 알바 게시판 조회
	@Override
	public List<JobVO> job_list(JobSearchCriteria scri) throws Exception {
		System.out.println(scri);
		return sqlSession.selectList("jobMapper.listPage", scri);
	}

	// 알바 게시글 갯수
	@Override
	public int job_listCount(JobSearchCriteria scri) throws Exception {
		return sqlSession.selectOne("jobMapper.listCount", scri);
	}

	// 알바 게시물 상세 보기
	@Override
	public JobVO job_view(int j_bno) throws Exception {
		return sqlSession.selectOne("jobMapper.read", j_bno);
	}

	// 알바 게시물 수정
	@Override
	public void update_boss(JobVO vo) throws Exception {
		sqlSession.update("jobMapper.update", vo);
	}

	// 알바 게시물 삭제
	@Override
	public void delete_boss(int j_bno) throws Exception {
		sqlSession.delete("jobMapper.delete", j_bno);
	}

	// 사장이 쓴 알바 구인 게시글 목록
	@Override
	public List<JobVO> my_jobList(Map map) throws Exception {
		return sqlSession.selectList("jobMapper.m_listPage",map );
	}

	// 사장이 쓴 알바 구인 게시글 목록 개수
	@Override
	public int my_jobListCount(JobCriteria cri) throws Exception {
		return sqlSession.selectOne("jobMapper.m_listCount", cri);
	}

	// 찜했는지 안했는지 체크
	@Override
	public int heartCheck(Map<String, String> check) throws Exception {
		return sqlSession.selectOne("jHeartMapper.heartCheck", check);
	}

	// 찜 체크하기
	@Override
	public void addHeart(Map<String, String> param) throws Exception {
		sqlSession.insert("jHeartMapper.addHeart", param);
	}

	// 찜 개수 늘리기 +1
	@Override
	public void upHeart(int j_bno) throws Exception {
		sqlSession.update("jobMapper.upHeart", j_bno);
	}

	// 찜 해제하기
	@Override
	public void subHeart(Map<String, String> param) throws Exception {
		sqlSession.delete("jHeartMapper.subHeart", param);
	}

	// 찜 개수 줄이기 -1
	@Override
	public void downHeart(int j_bno) throws Exception {
		sqlSession.update("jobMapper.downHeart", j_bno);
	}

}
