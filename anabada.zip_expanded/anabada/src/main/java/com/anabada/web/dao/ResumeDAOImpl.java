package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.JobVO;
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

	// 마이페이지에서 내가 지원한 알바목록
	@Override
	public List<ResumeVO> my_resumeList(Map map) throws Exception {
		return sqlSession.selectList("resumeMapper.mr_listPage", map);
	}

	// 마이페이지에서 내가 지원한 알바 개수
	@Override
	public int my_resumeListCount(String id) throws Exception {
		return sqlSession.selectOne("resumeMapper.mr_listCount", id);
	}

	// 마이페이지에서 내가 지원한 알바 볼 때 어떤 알바 구인공고 게시물인지
	@Override
	public List<JobVO> my_resumeJob(int[] jbno_array) throws Exception {
		return sqlSession.selectList("resumeMapper.mr_job", jbno_array);
	}

	//마이 알바 지원목록에서 지원서 삭제
	@Override
	public void my_resumeDelete(int[] delete_array) throws Exception {
		sqlSession.delete("resumeMapper.mr_delete", delete_array);
	}
	
	


}
