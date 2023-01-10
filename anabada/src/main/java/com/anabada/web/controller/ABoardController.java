package com.anabada.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.anabada.web.service.ABoardService;
import com.anabada.web.service.ALikeService;
import com.anabada.web.service.AReplyService;
import com.anabada.web.vo.ABoardVO;
import com.anabada.web.vo.ALikeVO;
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

	@Inject
	ALikeService likeService;

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
	public String read(Model model, ABoardVO boardVO, ALikeVO likeVO, MemberVO memberVO,
			@ModelAttribute("scri") ASearchCriteria scri, HttpServletRequest req) throws Exception {

		logger.info("게시글 상세보기");
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		
		logger.info("id : " + id);
		
		model.addAttribute("read", service.read(boardVO.getA_bno()));
		model.addAttribute("scri", scri);
		
		List<AReplyVO> replyList = replyService.readReply(boardVO.getA_bno());
		model.addAttribute("replyList", replyList);
		
		Map<String, String> likeChk = new HashMap<>();
		
		likeChk.put("id", id);
		likeChk.put("a_bno", Integer.toString(boardVO.getA_bno()));
		
		logger.info("likeChk : " + likeChk);
		
		int Chk = likeService.likeCheck(likeChk);
		
		model.addAttribute("Chk", Chk);
		
		logger.info("Chk : " + Chk);

		return "/a_board/readView";
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
	
	@RequestMapping(value = "/insertLike", method = RequestMethod.POST)
	public @ResponseBody String insertLike(ABoardVO boardVO, ALikeVO likeVO, @RequestParam(value = "id", required = false) String id, @RequestParam(value = "a_bno", required = false) int a_bno,
			HttpServletRequest request) throws Exception {
		System.out.println("insertLike 잘 넘어는지 확인");
		
		Map<String, String> bnoId = new HashMap<>();
		
		bnoId.put("id", id);
		bnoId.put("a_bno", Integer.toString(boardVO.getA_bno()));
		
		likeService.insertLike(bnoId);
		
		return "/a_board/readView";
	}
	
	@RequestMapping(value = "/deleteLike", method = RequestMethod.POST)
	public @ResponseBody String deleteLike(ABoardVO boardVO, ALikeVO likeVO, @RequestParam(value = "id", required = false) String id, @RequestParam(value = "a_bno", required = false) int a_bno, 
			HttpServletRequest request) throws Exception {
		System.out.println("deleteLike 잘 넘어오는지 확인");
		
		Map<String, String> bnoId = new HashMap<>();
		
		bnoId.put("id", id);
		bnoId.put("a_bno", Integer.toString(boardVO.getA_bno()));
		
		likeService.deleteLike(bnoId);
		
		return "/a_board/readView";
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report() {
		return "a_board/report";
	}
	
	@RequestMapping(value = "/reportError", method = RequestMethod.GET)
	public String reportError() {
		return "a_board/reportError";
	}
}
