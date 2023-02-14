package com.anabada.web.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.MemberDAO;
import com.anabada.web.vo.MemberVO;
import com.anabada.web.vo.SearchCriteria;

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
	public MemberVO memberFindId(MemberVO vo) throws Exception {
		return dao.memberFindId(vo);
	}
	
	@Override
	public int memberPwdCheck(MemberVO vo) throws Exception {
		int result = dao.memberPwdCheck(vo);
		return result;
	}
	
	@Override
	public void findPwdUpdate(MemberVO vo) throws Exception {
		dao.findPwdUpdate(vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		dao.memberUpdate(vo);
	}
	
	@Override
	public void passUpdate(MemberVO vo) throws Exception {
		dao.passUpdate(vo);
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

	@Override
	public int emailChk(MemberVO vo) throws Exception {
		int result = dao.emailChk(vo);
		return result;
	}

	@Override
	public int emailUpdateChk(MemberVO vo) throws Exception {
		int result = dao.emailUpdateChk(vo);
		return result;
	}

	@Override
	public List<MemberVO> memberList(SearchCriteria scri) throws Exception {
		return dao.memberList(scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return dao.listCount(scri);
	}

}
