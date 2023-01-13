package com.anabada.web.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.MemberDAO;
import com.anabada.web.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		dao.memberUpdate(vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}

	@Override
	public int nickChk(MemberVO vo) throws Exception {
		int result = dao.nickChk(vo);
		return result;
	}

	@Override
	public int nickUpdateChk(MemberVO vo) throws Exception {
		int result = dao.nickUpdateChk(vo);
		return result;
	}

}
