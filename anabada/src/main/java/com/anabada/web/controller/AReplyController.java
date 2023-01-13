package com.anabada.web.controller;

import java.time.LocalDate;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.AReplyService;
import com.anabada.web.vo.AReplyVO;
import com.anabada.web.vo.ASearchCriteria;

@Controller
@RequestMapping("/a_board/*")
public class AReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ABoardController.class);

	@Inject
	AReplyService replyService;
	
	//댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(AReplyVO replyVO, @ModelAttribute("scri") ASearchCriteria scri, RedirectAttributes rttr)
			throws Exception {

		logger.info("댓글 작성");

		replyService.writeReply(replyVO);

		rttr.addAttribute("a_bno", replyVO.getA_bno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addAttribute("cateType", scri.getCateType());

		return "redirect:/a_board/readView";
	}
	
	//댓글 수정
	@PostMapping("/replyUpdate")
	public ResponseEntity updateReply(AReplyVO replyVO) throws Exception {
		LocalDate now = LocalDate.now();
		
		replyVO.setR_regdate(java.sql.Date.valueOf(now));
		
		replyService.updateReply(replyVO);
		
		return new ResponseEntity(HttpStatus.OK);
	}

	//댓글 삭제
	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public String replyDelete(int rno, int bno) throws Exception {
	//replyDelete()안에 값은 view의 스크립트에 적힌 링크값이랑 같아야 한다.
		logger.info("댓글 삭제");
		
		AReplyVO vo = new AReplyVO();
		vo.setA_bno(bno);
		vo.setR_rno(rno);
		
		replyService.deleteReply(vo);
		
		return "redirect:/a_board/readView?a_bno="+bno;
	}

}

