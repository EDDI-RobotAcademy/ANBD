package com.anabada.web.dao;

import com.anabada.web.vo.MemberVO;

public interface MemberDAO {

	// 회원가입
	public void register(MemberVO vo) throws Exception;
		
	// 로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 아이디 찾기
	public MemberVO memberFindId(MemberVO vo) throws Exception;
	
	// 비밀번호 찾기
	public int memberPwdCheck(MemberVO vo) throws Exception;
	
	// 비밀번호 찾기 업데이트
	public void findPwdUpdate(MemberVO vo) throws Exception;
		
	// 회원정보 수정
	public void memberUpdate(MemberVO vo) throws Exception;
		
	// 비밀번호 변경
	public void passUpdate(MemberVO vo) throws Exception;
	
	// 회원 탈퇴
	public void memberDelete(MemberVO vo) throws Exception;
	
	// 아이디 중복 체크
	public int idChk(MemberVO vo) throws Exception;

	// 닉네임 중복 체크
	public int nickChk(MemberVO vo) throws Exception;
	
	// 닉네임 업데이트 중복 체크
	public int nickUpdateChk(MemberVO vo) throws Exception;
}
