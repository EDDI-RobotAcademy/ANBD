package com.anabada.web.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.QnaReplyService;
import com.anabada.web.service.QnaService;
import com.anabada.web.vo.PageMaker;
import com.anabada.web.vo.QnaReplyVO;
import com.anabada.web.vo.QnaVO;
import com.anabada.web.vo.SearchCriteria;

@Controller
@RequestMapping("/qna_board/*")
public class QnaController {

	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	// 게시글
	@Inject
	QnaService service;
	
	// 댓글
	@Inject
	QnaReplyService replyService;
	
	// 게시판 글쓰기 화면
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {
		logger.info("글쓰기 화면 ~ ");
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(QnaVO qnaVO) throws Exception {
		logger.info("글쓰기 완료 ~ ");
		
		service.write(qnaVO);
		
		return "redirect:/qna_board/list";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		logger.info("게시글 목록 조회 ~ ");
			
		model.addAttribute("list", service.list(scri));
			
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
			
		model.addAttribute("pageMaker", pageMaker);
			
		return "qna_board/list";
	}
	
	// 게시글 본문 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("게시글 조회 ~ ");
				
		model.addAttribute("read", service.read(qnaVO.getQ_no()));
		model.addAttribute("scri", scri);
		
		List<QnaReplyVO> replyList = replyService.readReply(qnaVO.getQ_no());
		model.addAttribute("replyList", replyList);
				
		return "qna_board/readView";
	}
			
	// 게시글 수정 화면
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		logger.info("게시글 수정 ~ ");
				
		model.addAttribute("update", service.read(qnaVO.getQ_no()));
		model.addAttribute("scri", scri);
			
		return "qna_board/updateView";
	}
			
	// 게시글 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("게시글 수정 완료 ~");
			
		service.update(qnaVO);
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
			return "redirect:/qna_board/list";
		}
			
	// 게시글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(QnaVO qnaVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("게시글 삭제 완료 ~");
				
		service.delete(qnaVO.getQ_no());
				
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
				
		return "redirect:/qna_board/list";
	}
	
	
	
	// 댓글 작성
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String replyWrite(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("댓글 작성 ~ ");

		replyService.writeReply(vo);
			
		rttr.addAttribute("q_no", vo.getQ_no());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/qna_board/readView";
	}
		
	// 댓글 수정 GET
	@RequestMapping(value = "/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(QnaReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("댓글 수정 GET ~ ");
			
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getQr_no()));
		model.addAttribute("scri", scri);
			
		return "qna_board/replyUpdateView";
	}
		
	// 댓글 수정 POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(QnaReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("댓글 수정 POST ~");
			
		replyService.updateReply(vo);
			
		rttr.addAttribute("q_no", vo.getQ_no());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/qna_board/readView";
	}
		
	// 댓글 삭제 GET
	@RequestMapping(value = "/replyDeleteView", method = RequestMethod.GET)
	public String replyDelete(QnaReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("댓글 삭제 GET ~ ");
			
		model.addAttribute("replyDelete", replyService.selectReply(vo.getQr_no()));
		model.addAttribute("scri", scri);
			
		return "qna_board/replyDeleteView";
	}
		
	// 댓글 삭제
	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String replyDelete(QnaReplyVO vo, RedirectAttributes rttr, SearchCriteria scri) throws Exception {
		logger.info("댓글 삭제 POST ~ ");
			
		replyService.deleteReply(vo);
			
		rttr.addAttribute("q_no", vo.getQ_no());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/qna_board/readView";
	}
		
}
