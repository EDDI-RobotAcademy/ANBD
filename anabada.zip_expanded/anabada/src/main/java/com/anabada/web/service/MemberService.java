package com.anabada.web.service;

import java.util.List;

import com.anabada.web.vo.MemberVO;
import com.anabada.web.vo.SearchCriteria;

public interface MemberService {

	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public MemberVO memberFindId(MemberVO vo) throws Exception;
	
	public int memberPwdCheck(MemberVO vo) throws Exception;
	
	public void findPwdUpdate(MemberVO vo) throws Exception;
	
	public void memberUpdate(MemberVO vo) throws Exception;
	
	public void passUpdate(MemberVO vo) throws Exception;
	
	public void memberDelete(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;

	public int nickChk(MemberVO vo) throws Exception;
	
	public int nickUpdateChk(MemberVO vo) throws Exception;
	
	public int emailChk(MemberVO vo) throws Exception;
	
	public int emailUpdateChk(MemberVO vo) throws Exception;

	public List<MemberVO> memberList(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
}
