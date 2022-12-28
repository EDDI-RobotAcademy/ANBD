package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PfileVO;
import com.anabada.web.vo.SearchCriteriapro;
import com.anabada.web.vo.SimilarSearch;

public interface PBoardDAO {
	
	//게시글 작성시 저장해주는 쿼리 
	public int write(PBoardVO pboardVO) throws Exception;
	
	//게시글 목록 보기
	public List<PBoardVO> list (SearchCriteriapro scri) throws Exception;

	// 총 게시글 숫자 
	public int listCount(SearchCriteriapro scri) throws Exception ;

	// 게시글 상세보기
	public PBoardVO read(int pno) throws Exception ;

	// 해당 타입의 개시글 총 수 구하기 
	public int typecount(String p_type) throws Exception ;

	// 유사한 상품 검색하기 
	public List<PBoardVO> similar(SimilarSearch si) throws Exception ;

	//게시글 저장시 사진 정보 저장 
	public void fileSave(Map<String, String> map) throws Exception ;

	//게시글 상세보기시 파일정보 가져오기
	public List<PfileVO> filelist(int pno) throws Exception ;

	//게시글 삭제 
	public void delete(int pno) throws Exception ;

	//게시글 수정시 이미지 삭제 
	public void deleteImg(int fno) throws Exception ;

	//fno에 해당하는 이미지의 Path 리턴 
	public String imgPath(int fno) throws Exception;

	// 수정한 게시글 저장
	public void update(PBoardVO pboardVO) throws Exception ;
  
	// Heart에 좋아요 누른 정보 저장 
	public void addHeart(Map<String, String> param) throws Exception ;

	//좋아요 누르면 PBoard에서 heart +1 
	public void upHeart(int pno) throws Exception ;

	//User가 하트를 눌렀는지 안눌렀는지 확인 ("pno" ,"id")
	public int heartCheck(Map<String, String> check) throws Exception ;

	// 하트테이블에서 하트 삭제 ("pno" ,"id")
	public void subHeart(Map<String, String> param) throws Exception;
	//게시글에서 p_heart -1 
	public void downHeart(int pno) throws Exception;

	//pno에 해당하는 사진경로중 가장 먼저올린것 1개의 filePath 반환
	public String getImg(int pno) throws Exception ;

}
