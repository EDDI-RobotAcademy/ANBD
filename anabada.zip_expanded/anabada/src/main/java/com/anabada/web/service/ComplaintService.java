package com.anabada.web.service;

import java.util.List;
import java.util.Map;

public interface ComplaintService{
	
	// 회원 누적 경고수 체크하는 쿼리
	public int count_caution(String id) throws Exception;
	
	// 경고가 4미만일 때 회원 경고수 +1 하는 쿼리
	public void add_caution(String id) throws Exception;
	
	// 경고쪽지 보내는 쿼리
	public void note_caution(Map map) throws Exception;
	
	// 경고가 4이상이면 회원탈퇴시키는 쿼리
	public void expel_member(String id) throws Exception;
	
	// 회원 제명시킬 때 제명된 회원의 이메일 저장해서 이후에 같은 이메일로 새로 가입하지 못하도록 막는 쿼리
	public void insert_email(String email) throws Exception;

	// 탈퇴시킬 회원의 email
	public String expel_email(String id) throws Exception;

	// 관리자 신고 삭제 관련
	public void delete_complaint(Map<String, Object> map) throws Exception;

}
