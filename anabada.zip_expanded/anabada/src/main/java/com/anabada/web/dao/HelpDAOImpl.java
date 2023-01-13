package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.HelpVO;
import com.anabada.web.vo.SearchCriteria;

@Repository
public class HelpDAOImpl implements HelpDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(HelpVO helpVO) throws Exception {
		sqlSession.insert("helpMapper.insert", helpVO);
	}

	// 게시글 목록
	@Override
	public List<HelpVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("helpMapper.listPage", scri);
	}

	// 게시물 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("helpMapper.listCount", scri);
	}

	// 게시글 조회
	@Override
	public HelpVO read(int h_no) throws Exception {
		return sqlSession.selectOne("helpMapper.read", h_no);
	}

	// 게시글 수정
	@Override
	public void update(HelpVO helpVO) throws Exception {
		sqlSession.update("helpMapper.update", helpVO);
	}

	// 게시글 삭제
	@Override
	public void delete(int h_no) throws Exception {
		sqlSession.delete("helpMapper.delete", h_no);
	}
	
}
