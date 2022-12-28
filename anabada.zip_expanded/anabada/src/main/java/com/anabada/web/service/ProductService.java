package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PfileVO;
import com.anabada.web.vo.SearchCriteriapro;

public interface ProductService {
	
	
	//게시글 작성 
	public int write(PBoardVO pboardVO) throws Exception;
	
	//게시글 목록 조회(list 조회)
    public List<PBoardVO> list (SearchCriteriapro scri) throws Exception ;
	//총 게시글 수 
	public int listCount(SearchCriteriapro scri) throws Exception ;
    //게시글 상세보기 
	public PBoardVO read(int pno) throws Exception ;
	//연관 상품 정보 담아오기 
	public List<PBoardVO> similar(PBoardVO pboardVO) throws Exception;

	//게시글 저장시 사진 이미지 저장 
	public void fileSave(Map<String, String> map) throws Exception ;

	//게시글을 클릭했을때 해당 게시글에 해당하는 사진 경로 가져오기 
	public List<PfileVO> filelist(int pno) throws Exception ;

	//게시글 삭제 
	public void delete(int pno) throws Exception ;

	//글 수정시  이미지 삭제 
	public void deleteImg(int fno) throws Exception ;

	//fno에 해당하는 사진의 Path 반환 
	public String imgPath(int fno) throws Exception ;

	//수정한 게시글 저장하기 
	public void update(PBoardVO pboardVO) throws Exception ;
    
	//Heart 테이블에 좋아요 누른 정보 저장 
	public void addHeart(Map<String, String> param) throws Exception ;

	//PBoard테이블에 pno에 해당하는 게시글의 p_heart +1 
	public void upHeart(int pno) throws Exception ;

	//User가 하트를 눌렀는지 안눌렀는지 확인 ("pno" ,"id")
	public int heartCheck(Map<String, String> check) throws Exception ;

	//하트 누른 정보 삭제 (하트 취소) ("pno" ,"id")
	public void subHeart(Map<String, String> param)throws Exception;

	//게시글에서 p_heart -1 
	public void downHeart(int pno)throws Exception;

	//pno에 해당하는 사진경로중 가장 먼저올린것 1개의 filePath 반환
	public String getImg(int pno) throws Exception ;


	
	// 게시물 수정 
	
	//게시물 삭제 
	
	
	

}
