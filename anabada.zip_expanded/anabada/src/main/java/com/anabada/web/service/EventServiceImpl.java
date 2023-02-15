package com.anabada.web.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.anabada.web.dao.EventBoardDAO;
import com.anabada.web.vo.EfileVO;
import com.anabada.web.vo.EvSearchCriteria;
import com.anabada.web.vo.EventBoardVO;

@Service
public class EventServiceImpl implements EventService {
	@Inject
	EventBoardDAO dao;

	//글쓰기 저장 
	@Override
	public int write(EventBoardVO eventBoardVO) throws Exception {
	 return	dao.write(eventBoardVO);
		
	}

	//파일저장 (eno , filepath)
	@Override
	public void fileSave(Map<String, String> fileMap) throws Exception {
		dao.fileSave(fileMap);
		
	}

	//리스트로 가기 
	@Override
	public List<EventBoardVO> list(EvSearchCriteria scri) throws Exception {
		
		return dao.list(scri);
	}

	@Override
	public String getImg(int eno) throws Exception {
		
		return dao.getImg(eno);
	}

	// 총게시글 수 리턴 
	@Override
	public int listCount(EvSearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}

	// 이벤트 참여여부 체크 ("eno" , "id") 참여시 1 , 미참여시 0 반환 
	@Override
	public int checkEv(Map<String, String> check) throws Exception {
		return dao.checkEv(check);
	}

	//게시글 상세보기
	@Override
	public EventBoardVO read(int eno) throws Exception {
		
		return dao.read(eno);
	}

	// 게시글 상세보기시 게시글의 사진정보 리턴
	@Override
	public List<EfileVO> filelist(int eno) throws Exception {
		return dao.filelist(eno);
	}

	//게시글 삭제 
	@Override
	public void delete(int eno) throws Exception {

		dao.delete(eno);
	}

	//참여하기 누른사람 참여 테이블에 저장 
	@Override
	public void addHeart(Map<String, String> param) throws Exception {
		dao.addHeart(param);
		
	}

	//eventboard 에서 e_total +1 
	@Override
	public void uptotal(int eno) throws Exception {
		dao.uptotal(eno);
		
	}

	//참여 취소자 참여테이블에서 삭제 
	@Override
	public void subHeart(Map<String, String> param) throws Exception {
		dao.subHeart(param);
		
	}

	//참여 취소 시 e_total-1 
	@Override
	public void downtotal(int eno) throws Exception {
         dao.downtotal(eno);		
	}

	// 이벤트 완료시키기 
	@Override
	public void endEvent(int eno) throws Exception {
		dao.endEvent(eno);
		
	}

	//총 응모 인원수 반환 
	@Override
	public int getTotal(int eno) throws Exception {
		
		return dao.getTotal(eno);
	}

	@Override
	public List<String> getAll(int eno) throws Exception {
		return dao.getAll(eno);
	}



	//winnerlist를 db에 저장 (eno , e_winner)
	@Override
	public void winner(EventBoardVO vo) throws Exception {
	dao.winner(vo);
		
	}

	//efno에 해당하는 사진의 Path 반환 
	@Override
	public String imgPath(int efno) throws Exception {
		return dao.imgPath(efno);
	}

	//글 수정시  이미지 삭제 (efno에 해당하는 사진을 테이블에서 삭제)
	@Override
	public void deleteImg(int efno) throws Exception {
		dao.deleteImg(efno);
	}

	//수정한 게시글 저장하기
	@Override
	public void update(EventBoardVO eventboardvo) throws Exception {
		dao.update(eventboardvo);
	}

	@Override
	public String getWin(Map<String, Integer> map) throws Exception {
		return dao.getWin(map);
	}
	




	
}
