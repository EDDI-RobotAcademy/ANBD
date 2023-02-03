package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.ComplaintVO;
import com.anabada.web.vo.JheartVO;
import com.anabada.web.vo.JobCriteria;
import com.anabada.web.vo.JobSearchCriteria;
import com.anabada.web.vo.JobVO;

@Repository
public class JobDAOImpl implements JobDAO{

	@Inject
	private SqlSession sqlSession;
	
	// 게시물 작성
	@Override
	public void job_insert(JobVO vo) throws Exception {
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
	public JobVO job_read(int j_bno) throws Exception {
		return sqlSession.selectOne("jobMapper.read", j_bno);
	}

	// 알바 게시물 수정
	@Override
	public void job_update(JobVO vo) throws Exception {
		sqlSession.update("jobMapper.update", vo);
	}

	// 알바 게시물 삭제
	@Override
	public void job_delete(int j_bno) throws Exception {
		sqlSession.delete("jobMapper.delete", j_bno);
	}


	// 찜했는지 안했는지 체크
	@Override
	public int job_heartCheck(Map<String, String> check) throws Exception {
		return sqlSession.selectOne("jHeartMapper.heartCheck", check);
	}

	// 찜 체크하기
	@Override
	public void job_addHeart(Map<String, String> param) throws Exception {
		sqlSession.insert("jHeartMapper.addHeart", param);
	}

	// 찜 개수 늘리기 +1
	@Override
	public void job_upHeart(int j_bno) throws Exception {
		sqlSession.update("jobMapper.upHeart", j_bno);
	}

	// 찜 해제하기
	@Override
	public void job_subHeart(Map<String, String> param) throws Exception {
		sqlSession.delete("jHeartMapper.subHeart", param);
	}

	// 찜 개수 줄이기 -1
	@Override
	public void job_downHeart(int j_bno) throws Exception {
		sqlSession.update("jobMapper.downHeart", j_bno);
	}

	
	//////////알바 마이페이지 관련
	// 사장이 쓴 알바 구인 게시글 목록
	@Override
	public List<JobVO> my_jobList(Map map) throws Exception {
		return sqlSession.selectList("jobMapper.mj_listPage",map );
	}

	// 사장이 쓴 알바 구인 게시글 목록 개수
	@Override
	public int my_jobListCount(String id) throws Exception {
		return sqlSession.selectOne("jobMapper.mj_listCount", id);
	}
	
	// 알바마이페이지에서 게시물 삭제
	@Override
	public void my_jobDelete(int[] delete_array) throws Exception{
		sqlSession.delete("jobMapper.mj_delete", delete_array);
	}

	// 알바찜 목록
	@Override
	public List<JheartVO> heart_jobLIst(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("jobMapper.h_listPage" , map);
	}

	// 알바 찜 개수
	@Override
	public int heart_jobLisCount(String id) throws Exception {
		return sqlSession.selectOne("jobMapper.h_listCount", id);
	}

	// 알바 찜에서 삭제
	@Override
	public Object heart_delete(int[] delete_array) throws Exception {
		return sqlSession.delete("jobMapper.h_delete", delete_array);
	}

	//////////////////알바 신고
	// 알바 신고 디비 저장
	@Override
	public void report_insert(ComplaintVO vo) throws Exception {
		sqlSession.insert("jobMapper.report_insert", vo);
	}

	// 알바 신고 내역 체크
	@Override
	public int report_chk(ComplaintVO vo) throws Exception {
		return sqlSession.selectOne("jobMapper.report_chk", vo);
	}

	// 마이페이지에서 게시물 삭제할 때 신고내역도 있으면 삭제하는 쿼리
	@Override
	public void delete_complaint(int[] delete_array) throws Exception {
		sqlSession.delete("jobMapper.delete_complaint", delete_array);
	}
	
	


}
