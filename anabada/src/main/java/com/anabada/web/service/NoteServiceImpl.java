package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.NoteDAO;
import com.anabada.web.vo.NoteCriteria;
import com.anabada.web.vo.NoteSearchCriteria;
import com.anabada.web.vo.NoteVO;

@Service
public class NoteServiceImpl implements NoteService {

	@Inject
	NoteDAO dao;
	
	@Override
	public void send(NoteVO vo) throws Exception{
		dao.send(vo);
	}
	
	@Override
	public int note_listCount(Map map) throws Exception {
		return dao.note_listCount(map);
	}

	@Override
	public List<NoteVO> note_list(Map map) throws Exception {
		return dao.note_list(map);
	}

	@Override
	public void delete_all(int[] delete_array) throws Exception {
		dao.delete_all(delete_array);
	}

	@Override
	public NoteVO note_view(int bno) throws Exception {
		return dao.note_view(bno);
	}


	@Override
	public void read_check(Map map) throws Exception {
		dao.read_check(map);
	}

	@Override
	public int no_readCount(String id) throws Exception {
		return dao.no_readCount(id);
	}

	@Override
	public void delete_receive(int[] delete_array) throws Exception {
		dao.delete_receive(delete_array);
	}

	@Override
	public void delete_send(int[] delete_array) throws Exception {
		dao.delete_send(delete_array);
	}

	@Override
	public void delete_send2(int bno) throws Exception {
		dao.delete_send2(bno);
	}

	@Override
	public void delete_receive2(int bno) throws Exception {
		dao.delete_receive2(bno);
	}

	@Override
	public void delete_detail(int bno) throws Exception {
		dao.delete_detail(bno);
	}

	@Override
	public List<String> get_members(Map map) throws Exception {
		return dao.get_members(map);
	}

	
	
	

}
