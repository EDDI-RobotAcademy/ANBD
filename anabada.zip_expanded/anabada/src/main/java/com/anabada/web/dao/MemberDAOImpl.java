package com.anabada.web.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.MemberVO;
import com.anabada.web.vo.SearchCriteria;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sql;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		sql.insert("memberMapper.register", vo);
	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.login", vo);
	}
	
	@Override
	public MemberVO memberFindId(MemberVO vo) throws Exception {
		return sql.selectOne("memberMapper.memberFindId", vo);
	}
	
	@Override
	public int memberPwdCheck(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.memberPwdCheck", vo);
		return result;
	}
	
	@Override
	public void findPwdUpdate(MemberVO vo) throws Exception {
		sql.update("memberMapper.findPwdUpdate", vo);
	}

	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		sql.update("memberMapper.memberUpdate", vo);
	}
	
	@Override
	public void passUpdate(MemberVO vo) throws Exception {
		sql.update("memberMapper.passUpdate", vo);
	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sql.delete("memberMapper.memberDelete", vo);
	}

	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.idChk", vo);
		return result;
	}

	@Override
	public int nickChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.nickChk", vo);
		return result;
	}

	@Override
	public int nickUpdateChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.nickUpdateChk", vo);
		return result;
	}

	@Override
	public int emailChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.emailChk", vo);
		return result;
	}

	@Override
	public int emailUpdateChk(MemberVO vo) throws Exception {
		int result = sql.selectOne("memberMapper.emailUpdateChk", vo);
		return result;
	}

	@Override
	public List<MemberVO> memberList(SearchCriteria scri) throws Exception {
		return sql.selectList("memberMapper.memberList", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sql.selectOne("memberMapper.listCount", scri);
	}

}
