package com.anabada.web.controller;

import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.ABoardService;
import com.anabada.web.service.AReplyService;
import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.APageMaker;
import com.anabada.web.vo.AReplyVO;
import com.anabada.web.vo.ASearchCriteria;
import com.anabada.web.vo.MemberVO;

@Controller
@RequestMapping("/a_board/*")
public class ABoardController {

	private static final Logger logger = LoggerFactory.getLogger(ABoardController.class);

	@Inject
	ABoardService service;

	@Inject
	AReplyService replyService;

	// 게시판글 작성 화면
	// 리턴값이랑 경로랑 같다면 안적어줘도 됨
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {

		logger.info("writeView");
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writeView(ABoardVO boardVO) throws Exception {

		logger.info("write");

		service.write(boardVO);

		return "redirect:/a_board/list";
		// redirect는 컨트롤러 주소를 찾아감
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") ASearchCriteria scri) throws Exception {

		logger.info("게시판 목록 보기");

		model.addAttribute("list", service.list(scri));

		APageMaker pageMaker = new APageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "/a_board/list";
	}

	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(Model model, ABoardVO boardVO, MemberVO memberVO, @ModelAttribute("scri") ASearchCriteria scri,
			HttpSession session) throws Exception {

		logger.info("게시글 상세보기");

		model.addAttribute("read", service.read(boardVO.getA_bno()));
		model.addAttribute("scri", scri);

		List<AReplyVO> replyList = replyService.readReply(boardVO.getA_bno());
		model.addAttribute("replyList", replyList);
		
		return "a_board/readView";
	}

	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(Model model, ABoardVO boardVO, MemberVO memberVO,
			@ModelAttribute("scri") ASearchCriteria scri) throws Exception {

		logger.info("게시글 수정하기 뷰페이지");

		model.addAttribute("update", service.read(boardVO.getA_bno()));
		model.addAttribute("scri", scri);

		return "a_board/updateView";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, RedirectAttributes rttr)
			throws Exception {

		logger.info("게시글 수정 완료");

		service.update(boardVO);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addAttribute("cateType", scri.getCateType());

		return "redirect:/a_board/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(ABoardVO boardVO, @ModelAttribute("scri") ASearchCriteria scri, RedirectAttributes rttr)
			throws Exception {

		logger.info("게시글 삭제 완료");

		service.delete(boardVO.getA_bno());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		rttr.addAttribute("cateType", scri.getCateType());

		return "redirect:/a_board/list";
	}

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
	
	@PostMapping("/replyUpdate")
	public ResponseEntity updateReply(AReplyVO replyVO) throws Exception {
		LocalDate now = LocalDate.now();
		
		replyVO.setR_regdate(java.sql.Date.valueOf(now));
		replyService.updateReply(replyVO);
		return new ResponseEntity(HttpStatus.OK);
	}

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
