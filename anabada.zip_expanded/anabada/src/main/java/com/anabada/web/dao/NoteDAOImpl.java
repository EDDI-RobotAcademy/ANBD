package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.ComplaintVO;
import com.anabada.web.vo.NoteCriteria;
import com.anabada.web.vo.NoteSearchCriteria;
import com.anabada.web.vo.NoteVO;

import oracle.net.aso.s;

@Repository
public class NoteDAOImpl implements NoteDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public void send(NoteVO vo) throws Exception {
		sqlSession.insert("noteMapper.insert", vo);
	}


	@Override
	public List<NoteVO> note_list(Map map) throws Exception {
		return sqlSession.selectList("noteMapper.listPage", map);
	}


	@Override
	public int note_listCount(Map map) throws Exception {
		return sqlSession.selectOne("noteMapper.listCount", map);
	}


	@Override
	public NoteVO note_view(int n_bno) throws Exception {
		return sqlSession.selectOne("noteMapper.read", n_bno);
	}
	
	@Override
	public void read_check(Map map) throws Exception {
		sqlSession.selectOne("noteMapper.read_check", map);
	}
	

	@Override
	public int no_readCount(String id) throws Exception {
		return sqlSession.selectOne("noteMapper.no_readCount", id);
	}


	@Override
	public void delete_receive(int[] delete_array) throws Exception {
		sqlSession.update("noteMapper.delete_receive", delete_array);
	}
	
	@Override
	public void delete_send(int[] delete_array) throws Exception {
		sqlSession.update("noteMapper.delete_send", delete_array);
	}
	
	@Override
	public void delete_all(int[] delete_array) throws Exception {
		sqlSession.delete("noteMapper.delete_all", delete_array);
	}

	@Override
	public void delete_send2(int n_bno) throws Exception {
		sqlSession.update("noteMapper.delete_send2", n_bno);
	}

	@Override
	public void delete_receive2(int n_bno) throws Exception {
		sqlSession.update("noteMapper.delete_receive2", n_bno);
	}

	@Override
	public void delete_detail(int n_bno) throws Exception {
		sqlSession.delete("noteMapper.delete_detail", n_bno);
	}

	@Override
	public List<String> get_members(Map map) throws Exception {
		return sqlSession.selectList("noteMapper.get_members", map);
	}


	// 이벤트 쪽지
	@Override
	public void send_event(Map map) throws Exception {
		sqlSession.insert("noteMapper.send_event", map);
	}


	@Override
	public void report_insert(ComplaintVO vo) throws Exception {
		sqlSession.insert("noteMapper.report_insert", vo);
		
	}



}
