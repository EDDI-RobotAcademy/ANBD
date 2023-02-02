package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.ComplaintVO;
import com.anabada.web.vo.NoteCriteria;
import com.anabada.web.vo.NoteSearchCriteria;
import com.anabada.web.vo.NoteVO;

public interface NoteService {

	// 메시지 보내는 메소드
    public void send(NoteVO vo) throws Exception;

    // 받은 전체 보는 메소드
	public List<NoteVO> note_list(Map map) throws Exception;
	
	// 메시지 전체 개수
	public int note_listCount(Map map) throws Exception;

	// 쪽지 리스트에 쪽지 디비에서 삭제
	public void delete_all(int[] delete_array) throws Exception;

	// 쪽지 상세보기
	public NoteVO note_view(int n_bno) throws Exception;

	// 읽은 거 처리
	public void read_check(Map map) throws Exception;

	// 안읽은 쪽지 개수 구하기
	public int no_readCount(String id) throws Exception;

	// 쪽지 삭제. 받은 사람꺼
	public void delete_receive(int[] delete_array) throws Exception;

	// 쪽지 삭제. 보낸 사람꺼
	public void delete_send(int[] delete_array) throws Exception;

	// 쪽지 상세보기에서 삭제. 보낸 사람꺼
	public void delete_send2(int n_bno) throws Exception;

	// 쪽지 상세보기에서 삭제. 받은 사람꺼
	public void delete_receive2(int n_bno) throws Exception;

	// 쪽지 상세보기에서 쪽지 디비에서 삭제
	public void delete_detail(int n_bno) throws Exception;

	// 해당 중고 게시글에 대해 쪽지한 사람들 리스트
	public List<String> get_members(Map map) throws Exception;
	
	// 이벤트 쪽지만 보내는 메소드
	public void send_event(Map map) throws Exception;

	// 쪽지 신고 디비 저장
	public void report_insert(ComplaintVO vo) throws Exception;
	
	// 쪽지 신고 내역있는지 체크
	public int report_chk(ComplaintVO vo) throws Exception;

	// 쪽지 받는 아이디가 존재하는지 체크
	public int id_chk(String id) throws Exception;

	// 관리자가 신고 쪽지 삭제
	public void delete_admin(int n_bno) throws Exception;

	// 쪽지 양쪽 모두가 삭제했을 때 신고내역이 있다면 신고내역도 삭제
	public void delete_complaint(int[] delete_array) throws Exception;

	// 신고내역도 삭제하기 위해서 쪽지가 보내는쪽, 받는 쪽 둘다에서 삭제됐는지 체크(쪽지 목록에서 삭제할때)
	public List<NoteVO> delete_chk(int[] delete_array) throws Exception;

	// 신고내역도 삭제하기 위해서 쪽지가 보내는 쪽, 받는 쪽 둘다에서 삭제됐는지 체크(쪽지 상세보기에서 삭제할 때)
	public int delete_chk2(int n_bno) throws Exception;

}
