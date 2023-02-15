package com.anabada.web.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface ComplaintDAO {

	// 회원 누적 경고수 체크하는 쿼리
	int count_caution(String id) throws Exception;

	// 경고가 4미만일 때 회원 경고수 +1 하는 쿼리
	void add_caution(String id) throws Exception;

	// 경고쪽지 보내는 쿼리
	void note_caution(Map map) throws Exception;

	// 경고가 4이상이면 회원탈퇴시키는 쿼리
	void expel_member(String id) throws Exception;

	// 회원 제명시킬 때 제명된 회원의 이름을 저장해서 이후에 같은 이메일로 회원가입 막지도록
	String expel_email(String id) throws Exception;

	// 강제 탈퇴시킬 회원의 email
	void insert_email(String email) throws Exception;
	
	// 관리자 알바 신고 내역 삭제
	void delete_complaint(Map<String, Object> map) throws Exception;

	//id에 해당하는 PNO 리스트 반환
	List<Integer> pno_list(String id) throws Exception;

	// pno에 해당하는 pfile의 filepath 반환 
	List<String> filepath_list(List<Integer> pno_list) throws Exception;

	 //회원 탈퇴시 해당 회원이 남긴 review에서 consumer 을 null로 변경
	void review_null(String id) throws Exception;

}
