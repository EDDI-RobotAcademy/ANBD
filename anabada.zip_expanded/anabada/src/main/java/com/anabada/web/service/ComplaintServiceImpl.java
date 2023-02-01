package com.anabada.web.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.ComplaintDAO;

@Service
public class ComplaintServiceImpl implements ComplaintService{

	@Inject
	ComplaintDAO dao;
	
	@Override
	public int count_caution(String id) throws Exception {
		return dao.count_caution(id);
	}

	@Override
	public void add_caution(String id) throws Exception {
		dao.add_caution(id);
	}

	@Override
	public void note_caution(Map map) throws Exception {
		dao.note_caution(map);
	}

	@Override
	public void expel_member(String id) throws Exception {
		dao.expel_member(id);
	}

	@Override
	public String expel_email(String id) throws Exception {
		return dao.expel_email(id);
	}

	@Override
	public void insert_email(String email) throws Exception {
		dao.insert_email(email);
	}

	@Override
	public void delete_complaint(Map<String, Object> map) throws Exception {
		dao.delete_complaint(map);
	}

}
