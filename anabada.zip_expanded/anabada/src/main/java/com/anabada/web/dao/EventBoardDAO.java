package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.EfileVO;
import com.anabada.web.vo.EvSearchCriteria;
import com.anabada.web.vo.EventBoardVO;

public interface EventBoardDAO {

	// 글쓰기 저장
	public int write(EventBoardVO eventBoardVO) throws Exception;

	// 사진정보 저장
	public void fileSave(Map<String, String> fileMap) throws Exception;

	// 게시글 목록보기
	public List<EventBoardVO> list(EvSearchCriteria scri) throws Exception;

	// eno중 가장 먼저 올린 사진 반환
	public String getImg(int eno) throws Exception;

	// 검색조건에 해당하는 총 게시글 숫자 리턴
	public int listCount(EvSearchCriteria scri) throws Exception;

	// 이벤트 참여여부 체크 ("eno" , "id") 참여시 1 , 미참여시 0 반환
	public int checkEv(Map<String, String> check) throws Exception;

	// 게시글 상세보기
	public EventBoardVO read(int eno) throws Exception;
	//게시글 상세보기시 파일정보 가져오기
	public List<EfileVO> filelist(int eno) throws Exception ;

	//게시글 삭제 
	public void delete(int eno)throws Exception;
	//참여하기 누른사람 참여 테이블에 저장 
	public void addHeart(Map<String, String> param) throws Exception;

	//eventboard 에서 e_total +1 
	public void uptotal(int eno) throws Exception ;

	//참여 취소자 참여테이블에서 삭제 
	public void subHeart(Map<String, String> param)  throws Exception;

	//참여 취소 시 e_total-1 
	public void downtotal(int eno) throws Exception ;

	// 이벤트 완료시키기 
	public void endEvent(int eno) throws Exception;

	//총 응모 인원수 반환 
	public int getTotal(int eno) throws Exception;

	public List<String> getAll(int eno) throws Exception ;

	//winner id 가져오기 
	public String getWin(int i)throws Exception;

	//winnerlist를 db에 저장 (eno , e_winner)
	public void winner(EventBoardVO vo) throws Exception;

	//efno에 해당하는 사진의 Path 반환 
	public String imgPath(int efno) throws Exception;

	//글 수정시  이미지 삭제 (efno에 해당하는 사진을 테이블에서 삭제)
	public void deleteImg(int efno) throws Exception;

	//수정한 게시글 저장하기
	public void update(EventBoardVO eventboardvo) throws Exception;

}
