package com.anabada.web.service;

import java.util.List;
import java.util.Map;

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



   // 읽은 거 처리
   public void read_check(Map map) throws Exception;

   // 안읽은 쪽지 개수 구하기
   public int no_readCount(String id) throws Exception;

   // 쪽지 삭제. 받은 사람꺼
   public void delete_receive(int[] delete_array) throws Exception;

   // 쪽지 삭제. 보낸 사람꺼
   public void delete_send(int[] delete_array) throws Exception;



}