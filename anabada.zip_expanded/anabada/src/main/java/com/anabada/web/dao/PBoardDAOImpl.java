package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.PBoardVO;
import com.anabada.web.vo.PfileVO;
import com.anabada.web.vo.ReviewCriteria;
import com.anabada.web.vo.ReviewVO;
import com.anabada.web.vo.SearchCriteriapro;
import com.anabada.web.vo.SimilarSearch;

@Repository
public class PBoardDAOImpl implements PBoardDAO {

	@Inject
	private SqlSession sql;

	// 게시글을 저장하는 쿼리
	@Override
	public int write(PBoardVO pboardVO) throws Exception {

	
		sql.insert("pBoardMapper.insert",pboardVO);
		int pnum = sql.selectOne("pBoardMapper.searchPno",pboardVO); 

		return pnum;

	}

	// 게시글 목록보기
	@Override
	public List<PBoardVO> list(SearchCriteriapro scri) throws Exception {

		return sql.selectList("pBoardMapper.listPage", scri);

	}

	// 총 개시글 숫자
	@Override
	public int listCount(SearchCriteriapro scri) throws Exception {

		return sql.selectOne("pBoardMapper.listCount", scri);
	}

	// 게시글 상세보기 (게시물 조회)
	@Override
	public PBoardVO read(int pno) {

		return sql.selectOne("pBoardMapper.read", pno); // 게시물 상세보기 정보 전송
	}

	// 타입에 해당하는 게시글 총 갯수 구하기
	@Override
	public int typecount(String p_type) throws Exception {

		return sql.selectOne("pBoardMapper.typecount", p_type);
	}

	// 유사한 상품 검색하는 쿼리 (tnum 은 랜덤 처리를 위한 숫자 )
	@Override
	public List<PBoardVO> similar(SimilarSearch si) throws Exception {

		return sql.selectList("pBoardMapper.similar", si);
	}

	// 게시글 저장시 사진경로 저장
	@Override
	public void fileSave(Map<String, String> map) throws Exception {
		sql.insert("pBoardMapper.fileSave", map);

	}

	// 게시글 상세보기시 사진정보 가져오기
	@Override
	public List<PfileVO> filelist(int pno) throws Exception {
		return sql.selectList("pBoardMapper.filelist", pno);
	}

	// 게시글 삭제
	@Override
	public void delete(int pno) throws Exception {
		sql.delete("pBoardMapper.delete", pno);

	}

	// 게시글 수정시 이미지 삭제
	@Override
	public void deleteImg(int fno) throws Exception {
		sql.delete("pBoardMapper.deleteImg", fno);

	}

	// fno에 해당하는 Path 리턴
	@Override
	public String imgPath(int fno) throws Exception {

		return sql.selectOne("pBoardMapper.imgPath", fno);
	}

	// 수정한 게시글 저장
	@Override
	public void update(PBoardVO pboardVO) throws Exception {
		sql.update("pBoardMapper.update", pboardVO);

	}

	// heart게시판에 좋아요 누른 정보 추가
	@Override
	public void addHeart(Map<String, String> param) throws Exception {
		sql.insert("HeartMapper.addHeart", param);

	}

	// 게시글에 p_heart +1
	@Override
	public void upHeart(int pno) throws Exception {
		sql.update("pBoardMapper.upHeart", pno);

	}

	// User가 하트를 눌렀는지 안눌렀는지 확인 ("pno" ,"id")
	@Override
	public int heartCheck(Map<String, String> check) throws Exception {

		return sql.selectOne("HeartMapper.heartCheck", check);
	}

	// 하트테이블에서 하트 삭제 ("pno" ,"id")
	@Override
	public void subHeart(Map<String, String> param) throws Exception {
		sql.delete("HeartMapper.subHeart", param);
	}

	// 게시글에서 p_heart -1
	@Override
	public void downHeart(int pno) throws Exception {
		sql.update("pBoardMapper.downHeart", pno);

	}

	// pno에 해당하는 사진경로중 가장 먼저올린것 1개의 filePath 반환
	@Override
	public String getImg(int pno) throws Exception {
		return sql.selectOne("pBoardMapper.getImg", pno);
	}

	// pno, p_buy 전달해서 상품 판매 상태 변경
	@Override
	public void change(Map<String, String> param) throws Exception {
		sql.update("pBoardMapper.change", param);

	}

	// id에 해당하는 리뷰 반환
	@Override
	public List<ReviewVO> reviewList(ReviewCriteria rescri) throws Exception {

		return sql.selectList("pBoardMapper.reviewList", rescri);
	}

	@Override
	public int reviewCount(ReviewCriteria rescri) throws Exception {
		return sql.selectOne("pBoardMapper.reviewCount", rescri);
	}

	// 조회수 +1
	@Override
	public void cuntup(int pno) throws Exception {
		sql.update("pBoardMapper.cuntup", pno);
		
	}

}
