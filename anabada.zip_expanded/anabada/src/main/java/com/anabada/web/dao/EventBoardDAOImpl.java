package com.anabada.web.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.anabada.web.vo.EfileVO;
import com.anabada.web.vo.EvSearchCriteria;
import com.anabada.web.vo.EventBoardVO;

@Repository
public class EventBoardDAOImpl implements EventBoardDAO {

	@Inject
	private SqlSession sql;

	//글쓰기 저장
	@Override
	public int write(EventBoardVO eventBoardVO) throws Exception {
		/*
		 * int pnum;
		 * 
		 * if(sql.selectOne("EventMapper.maxeno") == null) { pnum=1; }else { pnum =
		 * sql.selectOne("EventMapper.maxeno"); } eventBoardVO.setEno(pnum);
		 * sql.insert("EventMapper.insert",eventBoardVO);
		 */
		sql.insert("EventMapper.insert",eventBoardVO);
		int pnum = sql.selectOne("EventMapper.searchEno",eventBoardVO);
	
	return pnum;
		
	}

	//사진정보 저장 (eno , filepath)
	@Override
	public void fileSave(Map<String, String> fileMap) throws Exception {
		sql.insert("EventMapper.fileSave",fileMap);
		
	}

	//게시글 목록보기 
	@Override
	public List<EventBoardVO> list(EvSearchCriteria scri) throws Exception {
		return sql.selectList("EventMapper.list",scri);
	}

	@Override
	public String getImg(int eno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("EventMapper.getImg",eno);
	}

	// 조건에 해당하는 검색 총 갯수 리턴 
	@Override
	public int listCount(EvSearchCriteria scri) throws Exception {
		
		return sql.selectOne("EventMapper.listCount",scri);
	}

	// 이벤트 참여여부 체크 ("eno" , "id") 참여시 1 , 미참여시 0 반환 
	@Override
	public int checkEv(Map<String, String> check) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("EventMemMapper.checkEv",check);
	}

	//게시글 상세보기
	@Override
	public EventBoardVO read(int eno) throws Exception {
	
		//조회수 +1 
		sql.update("EventMapper.cuntup",eno);
		return sql.selectOne("EventMapper.read",eno); // 게시글 정보 읽어옴
	}

	//게시글 상세보기시 파일정보 가져오기
	@Override
	public List<EfileVO> filelist(int eno) throws Exception {
		return sql.selectList("EventMapper.filelist",eno);
	}

	//게시글 삭제 
	@Override
	public void delete(int eno) throws Exception {
           sql.delete("EventMapper.delete",eno);		
	}
	//참여하기 누른사람 참여 테이블에 저장 
	@Override
	public void addHeart(Map<String, String> param) throws Exception {
		sql.insert("EventMemMapper.addHeart",param);
		
	}

	//eventboard 에서 e_total +1 
	@Override
	public void uptotal(int eno) throws Exception {
		sql.update("EventMapper.uptotal",eno);
		
	}

	//참여 취소자 참여테이블에서 삭제 
	@Override
	public void subHeart(Map<String, String> param) throws Exception {
		sql.delete("EventMemMapper.subHeart",param);
		
	}

	//참여 취소 시 e_total-1 
	@Override
	public void downtotal(int eno) throws Exception {
		sql.update("EventMapper.downtotal",eno);
	}

	// 이벤트 완료시키기 
	@Override
	public void endEvent(int eno) throws Exception {
		sql.update("EventMapper.endEvent",eno);
	}

	//총 응모 인원수 반환 
	@Override
	public int getTotal(int eno) throws Exception {
		
		return sql.selectOne("EventMapper.getTotal",eno);
	}

	@Override
	public List<String> getAll(int eno) throws Exception {
		return sql.selectList("EventMemMapper.getAll",eno);
	}

	//winner id 가져오기 
	@Override
	public String getWin(int i) throws Exception {
		
		return sql.selectOne("EventMemMapper.getWin",i);
	}



	//winnerlist를 db에 저장 (eno , e_winner)
	@Override
	public void winner(EventBoardVO vo) throws Exception {
		sql.update("EventMapper.winner",vo);
		
	}

	//efno에 해당하는 사진의 Path 반환 
	@Override
	public String imgPath(int efno) throws Exception {
		return sql.selectOne("EventMapper.imgPath",efno);
	}

	//글 수정시  이미지 삭제 (efno에 해당하는 사진을 테이블에서 삭제)
	@Override
	public void deleteImg(int efno) throws Exception {
		sql.delete("EventMapper.deleteImg",efno);
	}

	//수정한 게시글 저장하기
	@Override
	public void update(EventBoardVO eventboardvo) throws Exception {
		sql.insert("EventMapper.update",eventboardvo);
	}
	
}
