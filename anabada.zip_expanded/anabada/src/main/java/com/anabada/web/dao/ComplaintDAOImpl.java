package com.anabada.web.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ComplaintDAOImpl implements ComplaintDAO{

	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public int count_caution(String id) throws Exception {
		return sqlSession.selectOne("complaintMapper.count_caution", id);
	}

	@Override
	public void add_caution(String id) throws Exception {
		sqlSession.update("complaintMapper.add_caution", id);
	}

	@Override
	public void note_caution(Map map) throws Exception {
		sqlSession.insert("complaintMapper.note_caution", map);
	}

	@Override
	public void expel_member(String id) throws Exception {
		sqlSession.delete("complaintMapper.expel_member", id);
	}

	@Override
	public String expel_email(String id) throws Exception {
		return sqlSession.selectOne("complaintMapper.expel_email", id);
	}

	@Override
	public void insert_email(String email) throws Exception {
		sqlSession.insert("complaintMapper.insert_email", email);
	}
	
	@Override
	public void delete_complaint(Map<String, Object> map) throws Exception {
		sqlSession.delete("complaintMapper.delete_complaint", map);
	}

}
