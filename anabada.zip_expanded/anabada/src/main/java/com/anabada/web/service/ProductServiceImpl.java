package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.PBoardDAO;
import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PfileVO;
import com.anabada.web.vo.ReviewCriteria;
import com.anabada.web.vo.ReviewVO;
import com.anabada.web.vo.SearchCriteriapro;
import com.anabada.web.vo.SimilarSearch;

@Service
public class ProductServiceImpl implements ProductService {

	// DAO 주입
	@Inject
	PBoardDAO dao;

	// 글쓰기 저장
	@Override
	public int write(PBoardVO pboardVO) throws Exception {

		return dao.write(pboardVO);

	}

	// 글목록 보기
	@Override
	public List<PBoardVO> list(SearchCriteriapro scri) throws Exception {
		System.out.println("scr O 2222 :" +scri);
		return dao.list(scri);
	}

	// 게시글 총 갯수
	@Override
	public int listCount(SearchCriteriapro scri) throws Exception {

		return dao.listCount(scri);
	}

	// 게시글 상세보기
	@Override
	public PBoardVO read(int pno) throws Exception {

		return  dao.read(pno);
	}

	// 유사한 상품 목록 얻어오기 (최신순으로 5개 가져오기 )
	@Override
	public List<PBoardVO> similar(PBoardVO pboardVO) throws Exception {
// 타입, pno 
		System.out.println("유사 pboardVO  : " +pboardVO );
		int num = dao.typecount(pboardVO.getP_type()); // 타입에 해당하는 전체 수 가져오기
        System.out.println("num : "+num);
		int tnum;
		if(num <6) {
			tnum = num-1;
		}else {
			tnum = 5;
		}
		System.out.println("tnum : " + tnum);
		
		
		// 랜덤 처리 된 것에서 게시글 6개 받아오기

		SimilarSearch si = new SimilarSearch();
		si.setSearchP_type(pboardVO.getP_type());
		si.setTnum(tnum);
		si.setSelpno(pboardVO.getPno());
		System.out.println("si : " + si);

		return dao.similar(si);
	}

	// 게시글 저장시 파일 저장
	@Override
	public void fileSave(Map<String, String> map) throws Exception {

		dao.fileSave(map);

	}

	// 게시글에 해당하는 사진 정보 가져오기 (게시글 상세보기떄 실행)
	@Override
	public List<PfileVO> filelist(int pno) throws Exception {

		return dao.filelist(pno);
	}

	//게시글 삭제 메소드 
	@Override
	public void delete(int pno) throws Exception {
		dao.delete(pno);
		
	}

	//게시글 삭제시 이미지 삭제 
	@Override
	public void deleteImg(int fno) throws Exception {
		
		dao.deleteImg(fno);
	}

	//fno에 해당하는 파일의Path 리턴
	@Override
	public String imgPath(int fno) throws Exception {
		
		return dao.imgPath(fno);
	}

	//게시글 수정 (수정한 게시글 정보 저장하기)
	@Override
	public void update(PBoardVO pboardVO) throws Exception {
		dao.update(pboardVO);
		
	}

	//Heart 테이블에 좋아요 정보 저장 (param 정보 pno , id )
	@Override
	public void addHeart(Map<String, String> param) throws Exception {
		dao.addHeart(param);
		
	}

	//PBoard 테이블에 pno 게시글에 p_heart +1 
	@Override
	public void upHeart(int pno) throws Exception {
		dao.upHeart(pno);
		
	}

	//User가 하트를 눌렀는지 안눌렀는지 확인 ("pno" ,"id")
	@Override
	public int heartCheck(Map<String, String> check) throws Exception {
		
		return  dao.heartCheck(check) ;
	}

	// 하트테이블에서 하트 삭제 ("pno" ,"id")
	@Override
	public void subHeart(Map<String, String> param) throws Exception {
		dao.subHeart(param);
		
	}

	// 게시판에서 p_heart -1 
	@Override
	public void downHeart(int pno) throws Exception {
		dao.downHeart(pno);
	}

	//pno에 해당하는 사진경로중 가장 먼저올린것 1개의 filePath 반환
	@Override
	public String getImg(int pno) throws Exception {
		
		return dao.getImg(pno);
	}


	//pno, p_buy 전달해서 상품 판매 상태 변경 
	@Override
	public void change(Map<String, String> param) throws Exception {
		dao.change(param);
		
	}

	// id에 해당하는 리뷰 반환 
	@Override
	public List<ReviewVO> reviewList(ReviewCriteria rescri) throws Exception {
		return dao.reviewList(rescri);
	}

	@Override
	public int reviewCount(ReviewCriteria rescri) throws Exception {
		
		return dao.reviewCount(rescri);
	}

	// 조회수 +1
	@Override
	public void cuntup(int pno) throws Exception {
          dao.cuntup(pno);		
	}

	// 최근본 목록 유효성 검사 
	@Override
	public List recent_chk(int[] recent_array) throws Exception {
		return dao.recent_chk(recent_array);
	}

	// pno에 해당하는 게시글이 존재하는지 유효성 검사 
	@Override
	public int postExistence(int pno) throws Exception {
		return dao.postExistence(pno);
	}

	

}
