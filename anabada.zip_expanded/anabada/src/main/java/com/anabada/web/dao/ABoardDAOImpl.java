package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.ASearchCriteria;
import com.anabada.web.vo.ComplaintVO;

@Repository
public class ABoardDAOImpl implements ABoardDAO {

	@Inject
	//*mapper.xml에 연결하려고 사용(관련 설정은 root-context.xml에서 함, sqlSession을 사용하기 위해 sqlSessionFactory 설정)
	private SqlSession sqlSession;
	
	//게시글 작성
	@Override
	public void write(ABoardVO boardVO) throws Exception {
		sqlSession.insert("boardMapper.insert", boardVO);
	}
	
	//전체 게시글 목록
	@Override
	public List<ABoardVO> list(ASearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.list", scri);
	}

	//전체 게시글 총 개수
	@Override
	public int listCount(ASearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.listCount", scri);
	}
	
	//게시글 상세보기
	@Override
	public ABoardVO read(int a_bno) throws Exception {
		return sqlSession.selectOne("boardMapper.read", a_bno);
	}
	
	//게시글 조회수
	@Override
	public void cnt(int a_bno) throws Exception {
		sqlSession.update("boardMapper.cnt", a_bno);
	}

	//게시물 수정
	@Override
	public void update(ABoardVO boardVO) throws Exception {
		sqlSession.update("boardMapper.update", boardVO);
	}
	
	//게시글 삭제
	@Override
	public void delete(int a_bno) throws Exception {
		sqlSession.delete("boardMapper.delete", a_bno);
	}

	//마이페이지 내가 쓴 글 목록
	@Override
	public List<ABoardVO> writeList(ASearchCriteria scri) throws Exception {
		return sqlSession.selectList("boardMapper.writeList", scri);
	}

	//마이페이지 내가 쓴 글 개수
	@Override
	public int writeListCount(ASearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.writeListCount", scri);
	}

	//게시글 신고 DB 저장
	@Override
	public void reportComplaint(ComplaintVO complaintVO) throws Exception {
		sqlSession.insert("boardMapper.reportComplaint", complaintVO);
	}

	//게시글 신고 내역 상세보기
	@Override
	public ABoardVO complaintRead(int a_bno) throws Exception {
		return sqlSession.selectOne("boardMapper.complaintRead", a_bno);
	}

}
