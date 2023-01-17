package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.ComplaintVO;
import com.anabada.web.vo.NoteCriteria;
import com.anabada.web.vo.NoteSearchCriteria;
import com.anabada.web.vo.NoteVO;

public interface NoteDAO {
	
	// 메시지 보내는 메소드
    public void send(NoteVO vo) throws Exception;
    
    // 메시지 리스트 메소드
 	public List<NoteVO> note_list(Map map) throws Exception;
 	
 	// 메시지 전체 개수
 	public int note_listCount(Map map) throws Exception;
 	
 	// 쪽지 리스트에 쪽지 삭제(배열)
 	public void delete_all(int[] delete_array) throws Exception;

 	// 쪽지 상세보기
	public NoteVO note_view(int n_bno) throws Exception;

	// 쪽지 읽은 거 처리
	public void read_check(Map map) throws Exception;

	// 안읽은 쪽지 갯수
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

	// 해당 중고게시물에 대한 쪽지를 주고 받은 사람들 리스트
	public List<String> get_members(Map map) throws Exception;

	
	// 이벤트 쪽지만 보내는 메소으
	public void send_event(Map map) throws Exception;

	// 쪽지 신고 디비 저장
	public void report_insert(ComplaintVO vo) throws Exception;
	
	// 쪽지 신고 여부 체크
	public int report_chk(ComplaintVO vo) throws Exception;


}
